---
layout: post
title:  "Welcome to Jekyll!"
description: "This is my first foray into the world of Jekyll so I will be documenting my progress here. It seems scary at first, but as you get into it it really isn't as terrifying as it seems, I promise!"
categories: jekyll update
author: Cooper B
---

![github jekyll image](http://timjames.me/img/jekyll/feature.jpg)
<small>source: http://timjames.me/img/jekyll/feature.jpg</small>

This is my first foray into the world of Jekyll so I will be documenting my progress here. It seems scary at first, but as you get into it it really isn't as terrifying as it seems, I promise!

## Installing Jekyll on Fedora
[http://linuxsuperuser.com/install-jekyll-on-fedora-23/](http://linuxsuperuser.com/install-jekyll-on-fedora-23/)
{% highlight html %}
sudo dnf install ruby-devel
sudo dnf install redhat-rpm-config
gem install jekyll
{% endhighlight %}

Installing Jekyll on Fedora was a breeze.

## Getting Started…
[https://jekyllrb.com/docs/quickstart](https://jekyllrb.com/docs/quickstart/)
{% highlight html %}
jekyll new nameofblog
cd nameofblog
jekyll serve
{% endhighlight %}
Now that the jekyll server is running, we can fire up our web browser and navigate to: [http://localhost:4000](http://localhost:4000)

## Failing Early, Failing Often: Lets get some content.
Jekyll can feel a little intimidating at first. No point trying to read mountains of documentation on all the various technical features, I'm just going to jump in. Best practice for learning FOSS is to fail early/often to learn better solutions and approaches: theory is no substitute for praxis. Luckily, we have the internet and surely others have failed before us, so lets employ our constructive laziness!

[http://lmgtfy.com/?q=jekyll+tutorial](http://lmgtfy.com/?q=jekyll+tutorial)

Okay lets go.

## Customising Appearance
Before I go and push my blog to a github page, I'm going to have a go at editing things locally and viewing them on the localhost jekyll server.
We can change the settings of our landing page in the _config.yml file. I'm using [sublimetext3](https://www.sublimetext.com/3) for my text editor as multiple cursors and extensive plugin support cannot be beaten in my eyes (plus its cross platform compatible which is super important for me).

If you open up the _config.yml you will notice that it has the same text as the localhost landing page. Editing it seems pretty straightforward to me. Just edit the text after the colon for the particular section. Let's give it a go.

I edited the part after title, but it didn't seem like my page was updating when I hit refresh on my browser for the localhost:4000 page. So I quit the jekyll server from terminal by hitting Ctrl+C and then re ran it
{% highlight html %}
jekyll serve
{% endhighlight %}


And now I can see my changes. 
Not really keen on having my email shared on my blog, so I deleted that line. Updated my description. Going well so far. Now that I've got some basic content on my page, I'm going to look at changing the style sheet for the blog.


## SASS: SCSS Style Sheets
The Style Sheet is in my-jekyll-folder/css/main.scss
First up I'm going to change the font family from Helevetica Neue to Source Sans Pro which is a fantastic freely available grotesque sans serif font developed by Paul D Hunt for Adobe. It is distributed under the SIL Open Font license. So in the spirit of FOSS, this is my font!  

Some other good sans-serif free fonts are OpenSans, Liberation Sans, Droid Sans, Roboto, Bebas Neue

Pretty easy so far.
I've noticed that other changes outside of _config.yml auto update, so no need to restart the server when making changes here. Just hit refresh
The templates for the pages and posts are in my-jekyll-folder/_layouts and you can edit the header and foot html in my-jekyll-folder/_includes
_sass/_layout.scss

The main style changes occur in my-jekyll-folder/_sass/_layout.scss 

So I fire up sublimetext3 and open the file.

I'm not super familiar with SASS style sheets, but looks fairly straight forward. First thing I want to do is change my Post Title style for my posts. So I scroll down to the Posts section in my text editor:
{% highlight css %}
.post-title {
    font-weight: 800;
    font-style: italic;
    font-size: 42px;
    color: #777;
    letter-spacing: -1px;
    line-height: 1;

    @include media-query($on-laptop) {
        font-size: 36px;
    }
}
{% endhighlight %}

Ah-Ha! .post-title seems to be what I'm looking for! A quick change of the font size and refresh in the browser confirms this. 

I want to change the weight of the font for post titles so I add font-weight to the section. From the main.scss file I know that our standard font weight is 400, but I decide I want a lighter standard weight so I change it to 200 and then I want the header to be Extra Bold / Heavy so I choose 800 for the post title weight. I also want to change the post title font colour to be a lighter gray colour so I add color: #777 which is short hand for #777777 which is the rgb hexadecimal colour code.

W3schools has lots of info on CSS editing:   [http://www.w3schools.com/css/css_font.asp](http://www.w3schools.com/css/css_font.asp)

## Uploading to Github
Now that I've got the basic styles set up how I want and I started putting this content in the example post in the _posts folder, I'm going to have a go at putting this up on github.

I'm following the instruction here: [https://pages.github.com/](https://pages.github.com/)

I also saw these instructions from git hub about using bundler so I followed them: [https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/)

After I used bundler I needed to install nodejs: 
{% highlight html %}
sudo dnf install nodejs
{% endhighlight %}

Now that I've got everything set up I go to github and [create a new repository](https://github.com/new)

Make sure to set the repository name as yourusername.github.io

Now that the repo is set up, open terminal and go to the jekyll page:
{% highlight html %}
git init
git add *
git commit -a -m "first commit"
git remote add origin https://github.com/user/repo.git
git push -u origin master
{% endhighlight %}

Now when we make changes commit the files and the push the commmits
{% highlight html %}
git commit -a -m "commit message"
git push origin --all
{% endhighlight %}

The jekyll pages are at is at [http://mergeandvary.github.io/](http://mergeandvary.github.io/)
mergeandvary is my github page, just swap that part for your own username.
username.github.io

## Learning Markdown
My initial blogging attempts were all done with a mix of markdown and html. Jekyll is great in that it lets you mix things up. However, for the sake of consistency I decided to learn a bit about markdown formatting and stick to one style as much as I can.

Here is a great [markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
