---
layout: post
title: "'Permission denied' error deploying Octopress to Github Pages"
date: 2013-04-19 22:54
comments: true
categories: [Octopress, Github Pages, SSH]
---

I just set up [Octopress](http://octopress.org/) as a framework for this blog, so I thought it would be appropriate to start off with a (minor) issue I ran into creating it. 
When running `rake deploy`, I received the following error mixed in with the output:

``` text
## Pushing generated _deploy website
Permission denied (publickey).
fatal: The remote end hung up unexpectedly
```

The solution is simple: the Octopress installation guide assumes you have set up SSH keys with Github. To resolve the issue, simply follow the instructions on Github for [setting up SSH keys](https://help.github.com/articles/generating-ssh-keys).
