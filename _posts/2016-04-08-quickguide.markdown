---
layout: post
title: "Quick Guide to Posting on the Blog via NeCTAR"
description: "This is just a quick guide of the steps I take to post on the blog using a NeCTAR virtual machine"
author: Cooper B
categories: nectar jekyll blog github
---

This is just a quick guide of the steps I take to post on the blog using a NeCTAR virtual machine

## NeCTAR Virtual Machine
[https://nectar.org.au/](https://nectar.org.au/)

1. Go to *Cloud Login* and login with university credentials
2. Click *Instances* in left tab and then select *Launch Instance* on the right
3. Give your instance a name, change flavour to m2.small
4. Choose *NeCTAR Fedora 23 x86_64 (450.1 MB)* for Image Name
5. Click Access and Security tab and choose your key pair and select SSH
6. Hit the *Launch* button

Now our instance will start up. Give it a moment to initialise/spawn. Once it is done, grab the IP address so we can login via SSH.
SSH Login via your preferred method - Linux terminal, PuTTY, MobaXTerm etc.

NOTE - The user name for the fedora machine is *ec2-user*

For PuTTY we put *ec2-user@255.255.255.255* in the Host Name box under Session, replacing the 255.255.255.255 with the IP address of our NeCTAR virtual machine. You also need to add your user key under Connection > SSH > Auth

## Cloning the GitHub
We already have github setup so lets clone it and work from there.

{% highlight bash %}
sudo dnf install git
git clone https://github.com/MQ-FOAR705/MQ-FOAR705.github.io.git
{% endhighlight %}

You might want to use the SSH method of cloning (rather than the https one I'm using here) that Brian discussed in class, assuming that you have setup your SSH keypair. I'll leave this up to someone else to write a quick tutorial on.

## Installing Jekyll
Now that we have the github cloned, lets navigate to that folder and install the jekyll github pages gem bundle. In the github I've already setup a Gemfile so we are all ready to go and install.

{% highlight bash %}
sudo dnf install ruby-devel redhat-rpm-config gcc zlib-devel nodejs
cd MQ-FOAR705.github.io
gem install bundler
bundle install
{% endhighlight %}

## Writing a Post
Before we write a post, we want to make sure we have the latest files from git, so we need to run `git pull` from the MQ-FOAR705.github.io directory. This is a really important step so that we avoid any commit conflicts. Once git pull has been done, we can `cd _posts` to get into the _posts directory to create a post. 

I'm just going to use nano for my text editor, but you might prefer something else.

`sudo dnf install nano`

Now lets make a post. The naming structure of the post is:

`YYYY-MM-DD-Your-Post-Name.markdown`

So this is the post I'm going tp make for today:

`nano 2016-04-08-Quickguide.markdown`

In the post we first need to add a YAML header which goes between three dashes at the top of the file.
{% highlight bash %}
---
layout: post
title: "Quick Guide to Posting on the Blog via NeCTAR"
description: "This is just a quick guide of the steps I take to post on the blog using a NeCTAR virtual machine"
author: Cooper B
categories: nectar jekyll blog github
---
{% endhighlight %}

The layout section tells it to use the post layout. The title is, well, the title of the blog post. The description part is the little blurb that shows on the front page under the title. The author will show up with the date of the post. Categories are like tags that the post is filed under.

Once we've done that we can add some content underneath using markdown. [This](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) is a good markdown cheatsheet. The main style setup for headers in the blog is header 2 which you can signify by using a double hash `##` before a line of text.

## Testing Out Our Changes
We can preview our changes with by running `bundle exec jekyll serve` from the MQ-FOAR705.github.io folder

Usually this provides a local web server on the loopback device a port 4000 - which we access by opening a web browser and navigating to [http://localhost:4000](http://localhost:4000) - However, now we run into a problem where we cannot access the localhost loopback device because we are on a remote virtual machine. The simplest solution to this that I found was to use ngrok.

First lets make sure we are in our home directory using `cd ~`

{% highlight bash %}
cd ~
sudo dnf install wget
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
{% endhighlight %}

ngrok allows us to pass a localhost port to an ngrok webpage by running `./ngrok 4000`

However, we want to run ngrok and jekyll serve side by side, so we need to run one as a background process which we can do by adding an ampersand `&` after the command. I've written a little bash script in the MQ-FOAR705.github.io folder that will automate this process:

{% highlight bash %}
cd ~/MQ-FOAR705.github.io
./servejekyll.sh
{% endhighlight %}

When you run this script you should get something along the lines of:
{% highlight bash %}
Tunnel Status                 online
Version                       2.0.25/2.0.25
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://27326b6e.ngrok.io -> localhost:4000
Forwarding                    https://27326b6e.ngrok.io -> localhost:4000
{% endhighlight %}

Grab the forwarding address, which in this case is `http://27326b6e.ngrok.io` - though this will change whenever you run it. Now you can put this in your webbrowser and you should be able to see everything. 

## Making a Commit
If you are happy with the changes, hit Ctrl+C to close the ngrok command. As we already ran the jekyll serve command alongside ngrok by running the script, then we don't need to run `bundle exec jekyll build` as it will have already done it for us.

{% highlight bash %}
git add -A
git commit -a -m "my awesome changes"
git push origin master
{% endhighlight %}

Congratulations! Hopefully you have just pushed your first post to the blog and haven't completely burnt the place down! Don't worry if you have messed something up - the great thing about github is that it saves all the revisions to the code, so anything drastic that happens we can just rollback to a previous working commit and go from there. But hopefully we wont need to do that :D

