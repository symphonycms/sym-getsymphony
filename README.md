# Symphony Network Ensemble

We are [rebuilding the Symphony site](http://getsymphony.com/discuss/thread/97171/) with [Factory](http://getsymphony.com/discuss/thread/91734/). And we have decided to do this publicly so the community can be involved in the process. In the end, we will have a case study of how to build a site that people can refer to as an example of best practices for developing a Symphony site. The project will also be released as a Symphony [Ensemble](http://getsymphony.com/discuss/ensembles/) so other sites in the [Symphony Network](http://getsymphony.com/discuss/blog/entry/new-symphony-website-plans/) will be able to start with the same code base. This repository is where you'll be able to fetch the code.

## Getting Started

To be involved in the collaborative development process, you will need a localhost environment with the following server requirements. In addition, the Symphony working groups and extension developers maintain all code as public git repositories hosted on GitHub. We welcome everyone's input. However, direct input on the code will require familiarity with git.

Individuals in the Symphony community have created some excellent resources for anyone who would like to learn more and would like to contribute to the project.

- [Getting Git for Symphony Development](http://getsymphony.com/learn/articles/view/getting-git-for-symphony-development/) by Jonas Downey
- [Using git andSymphony CMS](http://nbsp.io/symphony-cms/using-git-and-symphony-cms) by Rowan Lewis
- [On Git Submodules](http://symphonyextensions.com/articles/on-git-submodules/) by Nils Werner
- [A Symphony Workflow](https://gist.github.com/designermonkey/830688) by John Porter

There have also been interesting discussions on the Symphony forum and elsewhere:

- [Git: Trying to be a Welter-Middle-Heavyweight?](http://getsymphony.com/discuss/thread/65913/)
- [A successful Git branching model](http://nvie.com/posts/a-successful-git-branching-model/)

### Server Requirements

- PHP 5.2 or above
- PHP's LibXML module, with the XSLT extension enabled (--with-xsl)
- MySQL 5.0 or above
- An Apache or Litespeed webserver
- Apache's mod_rewrite module or equivalent

## Building a Symphony Ensemble

First, I should explain what a Symphony Ensemble is. You can find [more information about Ensembles](http://getsymphony.com/learn/concepts/view/ensembles/) on the Symphony site.

Ensembles bundle an entire Symphony project, including its database and workspace files, into an installable package.

### Development Environment

Assuming that you have a local development environment set up, you may want to first set up a couple virtual hosts.

#### Mac OS X

I am working on a Mac running Mac OS X 10.8.2 and using the default Apache web server. I create two virtual hosts. The `*.local` virtual host represents a local version of the production server. The `*.dev` virtual host is the local development server, for work on improvements, bug fixes and new features.

The `/etc/hosts` file includes the following:

    ### Projects
    127.0.0.1       getsymphony.dev
    127.0.0.1       getsymphony.local

The `/etc/apache2/httpd.conf` file includes the following line, to include the USERNAME.conf file:

    Include /private/etc/apache2/other/*.conf

The `/etc/apache2/users/USERNAME.conf` file includes the following (replace USERNAME with your Mac username):

    NameVirtualHost *:80
    NameVirtualHost 127.0.0.1
    
    <Directory "/Users/USERNAME/Sites">
      Options Indexes FollowSymLinks MultiViews
      AllowOverride All
      Order allow,deny
      Allow from all
      DirectoryIndex index.php index.html index.htm
    </Directory>
    
    <VirtualHost 127.0.0.1>
      ServerName getsymphony.dev
      DocumentRoot /Users/USERNAME/Sites/projects/getsymphony/dev/public
    </VirtualHost>
    
    <VirtualHost 127.0.0.1>
      ServerName getsymphony.local
      DocumentRoot /Users/USERNAME/Sites/projects/getsymphony/local/public
    </VirtualHost>

Once you have made these changes to your `hosts` file and Apache configuration, you can restart the web server. In a Terminal window, run the following command:

    sudo apachectl restart

Next, I will demonstrate a little trick with XSLT to test your development environment.

#### Use XSLT to Create the Project Directories

This is a silly little trick, but it demonstrates the power of XSLT that you get right out of the box with any Unix-based system, like Mac and Linux.

Create the site root directories if they haven't already been created. Open a Terminal window, you can run the following commands. Out of the box, Mac OS X no longer has a `Sites` directory. You could create two files in your user's directory.

Create a simple XML file with the name `hello.xml`:

    <?xml version="1.0" encoding="utf-8"?>
    <data>
      <salutation>Hello, World!</salutation>
    </data>

Create another file with the name `hello.xsl`:

    <?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="xml"
      doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
      omit-xml-declaration="yes"
      encoding="UTF-8"
      indent="yes" />
    
    <xsl:template match="/">
      <xsl:param name="salutation" select="data/salutation" />
      <html>
        <head>
          <title><xsl:value-of select="$salutation" /></title>
        </head>
        <body>
          <h1><xsl:value-of select="$salutation" /></h1>
        </body>
      </html>
    </xsl:template>
    
    </xsl:stylesheet>

Then, open a Terminal window and run the following.

    xsltproc -v -o ~/Sites/projects/getsymphony/dev/public/index.html hello.xsl hello.xml
    xsltproc -v -o ~/Sites/projects/getsymphony/local/public/index.html hello.xsl hello.xml 

If xsltproc is installed, and it should be by default on Mac and Linux, there should be two new files on your system, including all the directories required to form the path to each file:

    ~/Sites/projects/getsymphony/dev/public/index.html
    ~/Sites/projects/getsymphony/local/public/index.html

Now, after restarting the Apache web server, you should be able to navigate to the two virtual hosts:

- <http://getsymphony.dev/>
- <http://getsymphony.local/>

The index pages should say, "Hello, World!" like this:

    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Hello, World!</title>
      </head>
      <body>
        <h1>Hello, World!</h1>
      </body>
    </html>

The pages proudly wear a doctype that says the files are machine readable XML in the form of XHTML.

### Clone the Symphony Repository

To start, we will be working on the `getsymphony.dev` virtual host, since we don't yet have a production site to mirror in the `getsymphony.local` virtual host.

Change into the `public` directory of the `getsymphony.dev` server:

    cd ~/Sites/projects/getsymphony/dev/public

To clone a git repository into the public directory, we will need to have an empty directory. So remove the `index.html` file we used when creating the directory structure.

    rm index.html

Now, when you list the files in the directory, the directory should be empty:

    ls -al

Check that you have Git installed.

    git --version

With Mac OS X 10.8.2 and the version of Git that is installed with Xcode 4.6, this command returns the following:

    git version 1.7.12.4 (Apple Git-37)

It is now possible to clone the Symphony CMS git repository with a command that will recursively initialize and check out the submodules for the core extensions, cloning the repository into the current directory (indicated by the `.` at the end of the command).

    git clone --recursive git://github.com/symphonycms/symphony-2.git .


### Set Up Git Branches

I will set up three branches to start with:

- master
- develop
- symphony
- workspace

I have decided I will work on the bleeding edge and install the integration branch of the repository, since it currently represents Release Candidate 1 for version 2.3.2 of the Symphony CMS core. By the time the site is ready to launch, this version should be the latest stable version.

So, the `master` branch will represent the production site. The `develop` branch is where we will be fixing issues and developing new features. The `symphony` branch will be the latest stable version of Symphony (although, in this case, we're going to work a little ahead as a way of testing out the Release Candidate at the same time that we are building the ensemble. It might be a little risky, but we only live once.) The `workspace` branch will represent a completely separate history of commits to track the `workspace` directory of the ensemble.

**Note**: Here's where things might get a little complicated. I suppose the best thing to do would be to also have different branches of the workspace which would correspond to the production and development sites. It would be quite helpful to have a separate repository for the workspace, similar to the default workspace. However, it is also nice to have everything in one neat package, and because the workspace will be integrated as a submodule, it is easy enough to point to different commits for the different versions of the site. So, there is no need to unnecessarily complicate things unless we would like to create wildly divergent experiments.

First, let's start adjusting the names of the branches. We need to first check out the `integration` branch.

    git checkout integration

Well, that was easy. Now, we'll see that the extension submodules are currently out of sync. If you check the status of the repository's working tree:

    git status

You should see something like this:

    # On branch integration
    # Changes not staged for commit:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #   modified:   extensions/debugdevkit (new commits)
    #   modified:   extensions/export_ensemble (new commits)
    #   modified:   extensions/jit_image_manipulation (new commits)
    #   modified:   extensions/markdown (new commits)
    #   modified:   extensions/profiledevkit (new commits)
    #   modified:   extensions/selectbox_link_field (new commits)
    #
    no changes added to commit (use "git add" and/or "git commit -a")

We will need to update the submodules:

    git submodule update

which will return something like this:

    Submodule path 'extensions/debugdevkit': checked out '4518a5cab0b15a3d08b972dd06d7fd5fa8c309aa'
    Submodule path 'extensions/export_ensemble': checked out '64742947c11b9805105997d4482ccdf1e75c7b73'
    Submodule path 'extensions/jit_image_manipulation': checked out 'f8f44259cc958ec9ec58a89709d920249ec5db89'
    Submodule path 'extensions/markdown': checked out 'c967293ccbf34cf935ffe17d5a504a7ab31784d1'
    Submodule path 'extensions/profiledevkit': checked out '0920617c7eadd8a1124d7c8d37be576a1fe4f848'
    Submodule path 'extensions/selectbox_link_field': checked out 'dfda482a602304478d65c5f7d7677a0dbb1d1265'

Now, the working tree should be clean:

    git status

now returns this:

    # On branch integration
    nothing to commit (working directory clean)

Excellent! Now, since we want to use the `integration` branch (Symphony 2.3.2 Release Candidate 1) to develop the ensemble, let's delete the `master` branch for now and rename the `integration` branch as `symphony`. First, delete the `master` branch:

    git branch -d master

which should return something like this:

    Deleted branch master (was a31d300).

Then, rename the `integration` branch:

    git branch -m integration symphony

Now, you should be able to view the current branch:

    git branch -v

which should return something like this:

    * symphony fce1b1d Tagging RC1

Perfect!

Next, we should reconfigure the remote repositories. The Symphony repository should no longer be the origin, as it is now:

    git remote -v

which lists the remote repository URLs:

    origin  git://github.com/symphonycms/symphony-2.git (fetch)
    origin  git://github.com/symphonycms/symphony-2.git (push)

So, let's remove the `origin` remote and replace it with the new remote repository for the ensemble:

    git remote rm origin
    git remote add origin git@github.com:symphonycms/sym-getsymphony.git

**Note**: anyone who is not a member of the `symphonycms` organization and does not have admin access to the repository will not be able to interact with this repository. You will need to fork the repository and use your own account to push commits, but we will get to this later.

Let's also add back the remote that we just removed, so we can still pull in any updates from the `symphony` repository:  

    git remote add symphony git://github.com/symphonycms/symphony-2.git

And, we should now be able to list the remotes with `git remote -v` and see the following:

    origin  git@github.com:symphonycms/sym-getsymphony.git (fetch)
    origin  git@github.com:symphonycms/sym-getsymphony.git (push)
    symphony    git://github.com/symphonycms/symphony-2.git (fetch)
    symphony    git://github.com/symphonycms/symphony-2.git (push)

To test that things are working well, we should be able to update the `symphony` branch from the `symphony` remote. But remember, that we are using the `integration` branch of the repository.

    git pull symphony integration

Well, it looks like there have already been some additional commits, including a change to one of the extension submodules.

    remote: Counting objects: 52, done.
    remote: Compressing objects: 100% (19/19), done.
    remote: Total 38 (delta 27), reused 30 (delta 19)
    Unpacking objects: 100% (38/38), done.
    From git://github.com/symphonycms/symphony-2
     * branch            integration -> FETCH_HEAD
    Updating fce1b1d..2409e9c
    Fast-forward
     extensions/jit_image_manipulation                  |  2 +-
     symphony/assets/js/admin.js                        | 17 ++++++++++-------
     symphony/content/content.blueprintsdatasources.php | 17 +++++++++++++++--
     symphony/content/content.blueprintsevents.php      | 12 ++++++++++++
     symphony/lib/toolkit/class.lang.php                | 10 ++++++----
     symphony/lib/toolkit/fields/field.upload.php       |  2 +-
     6 files changed, 45 insertions(+), 15 deletions(-)

So, we will need to update the submodules again. If you like, we can update a single extension like so:

    git submodule update extensions/jit_image_manipulation

which might return something like this:

    Submodule path 'extensions/jit_image_manipulation': checked out '5db9798dee8d6af515488b77bf969e08c96f4a68'

With everything up-to-date, we can now create the other branches based on the current branch. First, we create the `master` branch:

    git checkout -b master

And we should see the following:

    Switched to a new branch 'master'

Now, we can also create the `develop` branch:

    git checkout -b develop

And you should now be using the `develop` branch:

    Switched to a new branch 'develop'

And we can see all the branches:

    git branch -v

We have three branches that are identical, based on the latest commit of the `integration` branch of the `symphony` remote.

    * develop  2409e9c Make the pagination disabled JS event more specific to handle when datasources are provided by extensions
      master   2409e9c Make the pagination disabled JS event more specific to handle when datasources are provided by extensions
      symphony 2409e9c Make the pagination disabled JS event more specific to handle when datasources are provided by extensions

We will leave the creation of the `workspace` branch until after the installation process, which will create the directory structure for the `workspace` directory.

For now, let's push the `master` and `develop` branches to the remote repository:

    git push origin master

We should see something like this when the `master` branch has been successfully pushed to the remote:

    Counting objects: 24496, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (6527/6527), done.
    Writing objects: 100% (24496/24496), 4.13 MiB | 21 KiB/s, done.
    Total 24496 (delta 17937), reused 24387 (delta 17858)
    To git@github.com:symphonycms/sym-getsymphony.git
     * [new branch]      master -> master

Now, let's do the same for the `develop` branch:

    git push origin develop

This takes significantly less time, since the branches are identical.

**Note**: We don't want to push the `symphony` branch, since this branch is only used for updating the core Symphony files for the working repository.

### Install Symphony

Next, we will tackle the Symphony install.

I am using Sequel Pro to manage MySQL databases. Create a couple databases:

- `getsymphony_dev`
- `getsymphony_local`

We will create a clean install of Symphony by omitting the default workspace. That is simple enough, since, by default, there is no workspace included in the Symphony installer. For detailed instructions on how to install Symphony, refer to the [Install Symphony tutorial](http://getsymphony.com/learn/tutorials/view/install-symphony/).

### The Symphony Workspace

The Symphony `workspace` directory generally stores all files related to the custom site or application. For an Ensemble, you could potentially store everything that you might need to reproduce the site defined by the files the `workspace` directory contains. However, if you needed any extensions beyond the core extensions, you would need some way to document what these dependencies are.

The approach that I have been using to maintain ensembles is to follow the same approach used by the Symphony installer, which includes extensions as submodules of the super project. However, I also include the workspace of the Ensemble as a submodule.

**Note**: The danger of the approach of including extensions as submodules is the dependency on third-party extensions, which sometimes have the unfortunate problem of being deprecated in favour of new extensions or being deleted by their owners. Make sure you have a ZIP archive for those instances when the original extensions go missing for whatever reason. Alternatively, avoid using submodules to maintain the complete code base as a single repository.

After installing Symphony for the first time, a clean install will include a `workspace` directory with the following structure:

- workspace
    - data-sources
    - events
    - jit-image-manipulation
    - pages
    - utilities

Now, that the `workspace` directory has been created as part of the install process, we can create a new repository branch to put this directory under version control. However, because it is merely a directory structure with no files, we will need to create files that Git will be able to track. Otherwise, the repository will be empty, since Git does not track empty directories. One common practice is to include `.gitkeep` files to maintain an empty directory structure until the directories contain files that can be tracked.

In a Terminal window, change directories into the `workspace` directory:

    cd workspace

Then, run the following command to create the `.gitkeep` files for each of the directories:

    touch data-sources/.gitkeep events/.gitkeep jit-image-manipulation/.gitkeep pages/.gitkeep utilities/.gitkeep

Now, we can initialize the Git repository for the `workspace` branch:

    git init

which should return something like this:

    Initialized empty Git repository in /Users/USERNAME/Sites/projects/getsymphony/dev/public/workspace/.git/

Running `git status` in the `workspace` directory should return the following:

    # On branch master
    #
    # Initial commit
    #
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #   data-sources/
    #   events/
    #   jit-image-manipulation/
    #   pages/
    #   utilities/

To add all the files in this directory, type `git commit .`, where the `.` indicates "everything in the current directory. Now, when you find out the status of the current working tree:

    git status

we should see something like the following:

    # On branch master
    #
    # Initial commit
    #
    # Changes to be committed:
    #   (use "git rm --cached <file>..." to unstage)
    #
    #   new file:   data-sources/.gitkeep
    #   new file:   events/.gitkeep
    #   new file:   jit-image-manipulation/.gitkeep
    #   new file:   pages/.gitkeep
    #   new file:   utilities/.gitkeep
    #

We are ready to commit the initial commit of the `workspace` branch:

    git commit -m "Initialize workspace branch of the Symphony Network Ensemble"

We should see something like the following with a successful commit:

    [master (root-commit) 1257fcc] Initialize workspace branch of the Symphony Network Ensemble
     0 files changed
     create mode 100644 data-sources/.gitkeep
     create mode 100644 events/.gitkeep
     create mode 100644 jit-image-manipulation/.gitkeep
     create mode 100644 pages/.gitkeep
     create mode 100644 utilities/.gitkeep

You'll notice that we are currently on the default branch, the `master` branch. We will need to change the name of the branch.

    git branch -m master workspace

Now, when we view a list of the branches in the repository with `git branch -v`, we should see:

    * workspace 1257fcc Initialize workspace branch of the Symphony Network Ensemble

Awesome! Now, we can push this new branch to the remote. Of course, to do this, we will need to add a remote.

    git remote add origin git@github.com:symphonycms/sym-getsymphony.git

Now, that we have a remote, we are ready to push the `workspace` branch to the remote:

    git push origin workspace

This command should return something like this:

    Counting objects: 4, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (2/2), done.
    Writing objects: 100% (4/4), 347 bytes, done.
    Total 4 (delta 0), reused 0 (delta 0)
    To git@github.com:symphonycms/sym-getsymphony.git
     * [new branch]      workspace -> workspace

### Export the Ensemble

At this point, we can save the `workspace` directory as an Ensemble. Let's do one thing so we can see the change when we install the Ensemble in another location. Change the name of the site. Open the `manifest/config.php` file in an editor and find the lines that read:

        ###### GENERAL ######
        'general' => array(
            'sitename' => 'Symphony CMS',
        ),
        ########

Change:

    'sitename' => 'Symphony CMS',

to:

    'sitename' => 'Symphony Network',

and save the file. You should now see the change reflected in the name of the site shown in the header of the Symphony admin area.

Now, navigate to the System -> Preferences page and click on the "Save Install Files" button.

In a Terminal window, navigate to the site root:

    cd ~/Sites/projects/getsymphony/dev/public

and check the status, `git status`, and you should see the following:

    # On branch develop
    # Changes not staged for commit:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #   modified:   install/includes/config_default.php
    #   modified:   install/includes/install.sql
    #
    no changes added to commit (use "git add" and/or "git commit -a")

Two files have been changed. To see the differences, do the following:

    git diff

Press the space bar to scroll down. Then press `q` to quit viewing the file differences.

You can also navigate into the `workspace` directory and view the status of the working tree:

    cd workspace
    git status

And you should see the following:

    # On branch workspace
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #   install.sql
    nothing added to commit but untracked files present (use "git add" to track)

Now, to finish creating the Ensemble, let's first add the `install.sql` file to the `workspace` branch:

    git add .
    git commit -m "Export Ensemble: add install.sql file"

which should return something like this:

    [workspace a2ccaff] Export Ensemble: add install.sql file
     1 file changed, 163 insertions(+)
     create mode 100644 install.sql

And push this new commit to the remote repository:

    git push origin workspace

Then, change directories up to the root of the site:

    cd ..

And first add the `workspace` directory as a submodule. First, we need to make sure that the `.gitignore` file no longer includes the `workspace` as a directory to ignore. Open the `.gitignore` file:

    .htaccess
    workspace/
    manifest/
    install-log.txt
    install/logs/

And remove the `workspace` directory from the list, so the file looks like this:

    .htaccess
    manifest/
    install-log.txt
    install/logs/

With the `.gitignore` file saved, we can now add the `workspace` branch of the repository as a submodule:

    git submodule add git://github.com/symphonycms/sym-getsymphony.git workspace

which should return the following:

    Adding existing repo at 'workspace' to the index

Running `git status` shows that there are two files that have been staged to be committed by the `git submodule` command:

    # On branch develop
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #   modified:   .gitmodules
    #   new file:   workspace
    #
    # Changes not staged for commit:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #   modified:   .gitignore
    #   modified:   install/includes/config_default.php
    #   modified:   install/includes/install.sql
    #

Let's also include the rest of the modified files:

    git add -u

Now, run `git status` to check that everything has been staged:

    # On branch develop
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #   modified:   .gitignore
    #   modified:   .gitmodules
    #   modified:   install/includes/config_default.php
    #   modified:   install/includes/install.sql
    #   new file:   workspace
    #

This time, we will commit with a multiline message, launching the default editor with this command:

    git commit

Then, press `i` to enter insert mode (if you are using vi or vim as your default editor), and enter the following:

    Initialize Symphony Network Ensemble
    
    Modify the .gitignore files, update the install files and include the workspace directory as a submodule

Then, press the ESC key and type `:wq` to write the file and quit, which should return to the command line prompt:

    [develop b1fbac0] Initialize Symphony Network Ensemble
     5 files changed, 119 insertions(+), 109 deletions(-)
     create mode 160000 workspace

Push the new commit to the remote, and we're done creating our first Ensemble.

    git push origin develop

### Workspace README File

However, to make this Ensemble complete, let's add the documentation that helped us to get to this point. Navigate down to the workspace directory. Type the first few characters of the directory and press the TAB key.

    cd wor [TAB]

This should autocomplete the name of the directory for you, so you don't have to type so much. (Typing one character probably would have worked just as well.)

    cd workspace

Now, create a file called `README.md` and save this file with the content of your documentation formatted in [Markdown syntax](https://help.github.com/articles/github-flavored-markdown).

Once you have saved the file, commit and push the file to the `workspace` branch of the remote repository.

    git add .
    git commit -m "Add README file"
    git push origin workspace

Which should return something like this:

    Counting objects: 15, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (8/8), done.
    Writing objects: 100% (8/8), 1.73 KiB, done.
    Total 8 (delta 3), reused 0 (delta 0)
    To git@github.com:symphonycms/sym-getsymphony.git
       2409e9c..b1fbac0  develop -> develop

Now, make sure that the super project (the parent repository of the submodule) knows about the change to the submodule repository. Change directories up to the root:

    cd ..

Then, check the status with `git status`:

	# On branch develop
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#   (commit or discard the untracked or modified content in submodules)
	#
	#	modified:   workspace (new commits)
	#

The super project recognizes that there have been changes made to the submodule. If the changes had not been committed, it would have said:

	#	modified:   workspace (untracked content)

So, update the submodule by adding the changed directory, committing it and pushing the changes:

	git add workspace
	git commit -m "Update the workspace submodule: Add README file"
	git push origin develop

And that's it. Of course, this is a worthless example of an Ensemble, since all it does is change the name of the site. But, it's just a starting point for some amazing things.

### Testing the Ensemble

To test whether our Ensemble set up is working, let's now use the virtual host that we set up initially for the local copy of the production site, `getsymphony.local`. So, in a Terminal window, navigate to the root of the virtual host:

	cd ~/Sites/projects/getsymphony/local/public

Then, make sure the directory is empty. We created an HTML file earlier. Let's remove it:

	rm index.html

Now, we're ready to clone the Ensemble repository, using the `--recursive` option to initialize and check out all the submodules, specifying the `develop` branch instead of the default `master` branch:

	git clone --recursive --branch develop git://github.com/symphonycms/sym-getsymphony.git .

The test comes when we try to install the Ensemble. Navigate to http://getsymphony.local/ and we should be redirected to the installer page. The modified site name will actually display in the Symphony installer screen as the value of the first field, "Name," under the heading, "Website Preferences." If so, the Ensemble is configured properly. We'll know for sure when the Ensemble installs successfully and you can log into the Symphony admin area to view the name of the site in the header.

It works!


### Install Dump DB Extension

When developing an ensemble with Git, there are times when we find that something didn't work exactly as planned, so we need a way of being able to roll back changes to a point in the history of the repository just before things started going down the wrong path.


#### Issues with Development Rollbacks 

With the Export Ensemble extension, it is possible to continuously save the database changes and commit these changes as part of the Git repository history. But because of the syntax being used by the SQL files, it is not possible to use the install file to import data into a MySQL database. The database prefix is sanitized by the export process, so that the SQL statements in the `install.sql` files refer to the `tbl_` prefix, which is changed to the prefix specified in the Symphony installation process. So, unless we want to run a string replacement process on the SQL file, the only way to use the Ensemble installer files is by installing Symphony. This means having to prepare the server files for installation again. Files, directories and database tables must be removed.

- Remove `.htaccess` file
- Remove `manifest` directory
- Remove all database tables

If we need to install the Ensemble again, we can run the following command from the site root:

	sudo rm -rf .htaccess manifest

When the tables of the database have been deleted, navigate to the virtual host in a browser and go through the install process again. This is necessary, because the Export Ensemble extension sanitizes the files by removing any sensitive preferences, author data and server configuration settings. These details must be entered again in the installation process. You can imagine how tedious this can become to have to tear down and install every time you need to roll back to a previous point in the repository history.


#### Dump DB Extension

It is much easier to have the SQL data dumped to a file and to maintain this file in the Git repository. Whenever you need to roll back to a previous version, check out the commit, then drop the tables and import the SQL dump from that commit. The Dump DB extension fulfills this requirement by providing an interface for saving the structural data and the author data to separate files. This gives us the option of maintaining a public repository, but only saving the structural data to the `data.sql`. Alternatively, we can maintain a private repository, if the author data must be maintained in the repository as an important part of the development process. This is something that the Export Ensemble extension cannot do, since it removes author data in the export process.

**Be aware that you should never publicly share the `author.sql` file created by the Dump DB extension, as it contains sensitive author login and password data.**

The Dump DB extension is the perfect companion to the Export Ensemble in the process of developing a Symphony Ensemble. So, let's install the Dump DB extension as a submodule and install it in the Symphony Network Ensemble.

First, navigate to the site root:

	cd ~/Sites/projects/getsymphony/dev/public

Then, add the Dump DB extension as a submodule:

	git submodule add git://github.com/nils-werner/dump_db.git extensions/dump_db

This will clone and checkout the appropriate commit of the Dump DB extension into the `extensions/dump_db` directory and stage the `.gitmodules` file and the Dump DB extension submodule to be committed. Then, we can commit this change to the `develop` branch:

	git commit -m "Add Dump DB extension as a submodule"

Navigate to the [Extensions page](http://getsymphony.dev/symphony/system/extensions/) in the Symphony admin. Select the Dump DB extension by clicking on the row to select it. Use the "With Selected..." menu at the bottom of the page to select the "Enable/Install" option and click the "Apply" button to install the extension.

Now, we should be able to navigate to the [Preferences](http://getsymphony.dev/symphony/system/preferences/) page to see the "Save Authors" and "Save Data" buttons in the "Dump Database" field set.


#### Save the SQL Files

First, let's modify the configuration settings for the [Dump DB extension](http://symphonyextensions.com/extensions/dump_db/) by manually adding the following to the `manifest/config.php` file (at the end of the file should be fine):

		###### DUMP_DB ######
		'dump_db' => array(
			'last_sync' => '2013-02-28T10:56:51-08:00',
			'path' => '/workspace/sql',
			'restore' => 'yes'
		),
		########

Next, create the `workspace/sql` directory:

	git mkdir workspace/sql

Because we are working locally, we can avoid permissions issues by modifying the `.git/config` file to prevent the repository from tracking file mode changes. At the top of the file, you'll see:

	[core]
		repositoryformatversion = 0
		filemode = true
		bare = false
		logallrefupdates = true
		ignorecase = true
		precomposeunicode = false

Change the `filemode` for the Git repositories in the site root directory and the workspace directory to:

	filemode = false

Then, Git will ignore changes to the Unix permissions settings for files when checking the working tree for modified files.

While we are working on local files, we can avoid permissions problems we might have when saving Dump DB or Export Ensemble files by opening up the permissions on certain files and directories.

	sudo chmod -R 777 install
	sudo chmod 777 workspace/install.sql

Just be sure that these permissions are properly set to be more secure when working on the remote production and development servers. Of course, for security reasons, the install files should be removed on a production server.

Now, navigate to the Symphony admin System > [Preferences](http://getsymphony.dev/symphony/system/preferences/) page. Click on the "Save Data" button in the Dump Database field set. Also, click on the "Save Install Files" button in the Export Ensemble field set.

On the command line, change into the `workspace` directory and stage the `install.sql` file and the `sql` directory to be committed.

	cd workspace
	git add install.sql sql

Running `git status` returns:

	# On branch workspace
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	modified:   install.sql
	#	new file:   sql/data.sql
	#

Commit the changes and push them:

	git commit -m "Add SQL files after installing Dump DB extension"
	git push origin workspace

Then, move back up to the site root and stage the `install` and `workspace` directories to be committed:

	cd ..
	git add install workspace
	git status

which should return:

	# On branch develop
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	modified:   install/includes/config_default.php
	#	modified:   workspace
	#

Commit these changes to update the `workspace` submodule and to include changes to the Export Ensemble install files and push them to the remote.

	git commit -m "Update install files and workspace submodule after installing Dump DB extension"
	git push origin develop


### Test the Dump Database Extension

To check that everything is working well, pull the changes into the getsymphony.local virtual host. Change into the root directory of the site, pull the `develop` branch from the `origin` remote, and update the submodules:

	cd ~/Sites/projects/getsymphony/local/public
	git pull origin develop
	git submodule update --init

It is not possible to update the database with Dump DB until the extension is enabled. By installing the updated Ensemble, we will be able to include the configuration settings for the Dump DB extension. Let's get the getsymphony.local virtual host in sync with the getsymphony.dev virtual host by reinstalling the Ensemble.

	sudo rm -rf .htaccess manifest

Then, remove all the database tables from the `getsymphony_local` MySQL database. Now, install Symphony by navigating to <http://getsymphony.local/> in a browser.

If all went well, we should be able to open the Extensions page in a browser and see that the Dump DB extension is enabled.

Lets treat the `dev` site as the development site. Then we can work with the `local` site as if it were the production site. To test the set up, let's create a Home page on the development site. Navigate to the [Pages index page](http://getsymphony.dev/symphony/blueprints/pages/) and click on the "Create New" button. Fill in the following values:

- Page Settings > Title: `Home`
- Page Settings > Page Type: `index`

Then, click the "Create Page" button. You should now be able to click on the site name on the left side of the Symphony admin header to navigate to the Home page. Then, navigate to the System > [Preferences](http://getsymphony.dev/symphony/system/preferences/) page, and click on the "Save Data" and "Save Install Files" buttons. 

In a Terminal window, navigate to the `workspace` directory:

	cd ~/Sites/projects/getsymphony/dev/public/workspace

Then, check the status of the working tree with `git status`:

	# On branch workspace
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   install.sql
	#	modified:   sql/data.sql
	#
	# Untracked files:
	#   (use "git add <file>..." to include in what will be committed)
	#
	#	pages/home.xsl
	no changes added to commit (use "git add" and/or "git commit -a")

Let's add all of these changes to be staged.

	git add .

Now, the install files and the Home page template are staged to be committed:

	# On branch workspace
	# Changes to be committed:
	#   (use "git reset HEAD <file>..." to unstage)
	#
	#	modified:   install.sql
	#	new file:   pages/home.xsl
	#	modified:   sql/data.sql
	#

Commit these changes to the `workspace` branch:

	git commit -m "Add Home page and update SQL files"

which returns this:

	[workspace 6737b64] Add Home page and update SQL files
	 3 files changed, 22 insertions(+), 2 deletions(-)
	 create mode 100644 pages/home.xsl

and push the commit to the `origin` remote:

	git push origin workspace

which returns:

	Counting objects: 12, done.
	Delta compression using up to 4 threads.
	Compressing objects: 100% (6/6), done.
	Writing objects: 100% (7/7), 1.14 KiB, done.
	Total 7 (delta 3), reused 0 (delta 0)
	To git@github.com:symphonycms/sym-getsymphony.git
	   fac240c..6737b64  workspace -> workspace

Navigate back up to the superproject and check the status:

	cd ..
	git status

We should see:

	# On branch develop
	# Changes not staged for commit:
	#   (use "git add <file>..." to update what will be committed)
	#   (use "git checkout -- <file>..." to discard changes in working directory)
	#
	#	modified:   install/includes/config_default.php
	#	modified:   install/includes/install.sql
	#	modified:   workspace (new commits)
	#
	no changes added to commit (use "git add" and/or "git commit -a")

See what has changed with `git diff`.

If everything is good, we can commit these changes and push them to `origin`:

	git add install workspace
	git commit -m "Update workspace submodule and install files after adding Home page"
	git push origin develop

Great! Now, we can switch back to our "production" site, <http://getsymphony.local/>, and check out the changes.

	cd ~/Sites/projects/getsymphony/local/public
	git pull origin develop
	git submodule update

This time, there are no new submodules to initialize, so we left off the `--init` option from the `git submodule update` command.

Now, there is one step left: navigate to the System > [Preferences](http://getsymphony.local/symphony/system/preferences/) page to restore the database. Click on the "Restore Data" button in the Dump Database fieldset. And alert box will display with the following message:

> **The page at getsymphony.local says:**  
> Do you really want to overwrite your database with the contents from the file?

Click the "OK" button. A notification displays at the top of the page when the database has successfully been restored:

> Data successfully restored from /workspace/sql/data.sql in 68 queries.

Notice that the Home page has been added to the Blueprints > [Pages](http://getsymphony.local/symphony/blueprints/pages/) index. And we can also navigate to the Home page on the front end: <http://getsymphony.local/>.

So, there you have it: a Git-oriented process for deploying sites from development to production (sort of).

**Note**: this approach does not take into account the proper workflow for a live site with user-generated content, as the Dump DB extension will restore the database with a series of MySQL `INSERT` statements. If anything has been added or deleted on the production site, the Dump DB restore process has the potential of wreaking havoc because of differences with the `AUTO_INCREMENT` values. The Dump DB extension works well with an incremental process of updating structural database changes in a development process, such as the creation of a Symphony Ensemble or a new site design. However, if you delete a section, for example, the Dump DB restore process does not take care of deleted rows. You will need to remove all the structural data tables and then manually import the SQL file. I have learned this the hard way. I have come to trust this process of saving both the Export Ensemble and Dump DB SQL files as often as I make structural changes to an Ensemble. If things go awry, I can alway reinstall from a commit that I trust was in a working state.

For a live site on a production server, the process should be reversed, where data on the production server is considered canonical. To maintain database synchronization between development and production environments, strongly consider using the [Database Synchroniser](http://symphonyextensions.com/extensions/db_sync/) extension or the [Continuous Database Integration](http://symphonyextensions.com/extensions/cdi/) extension.