# somecompanytest
## Description
This a sample of an Ruby Rails environment creation and sample application deploy using AWS CloudFormation and Puppet on CentOS.

## Pre-requisites
### AWS:
1. Create an AWS Key Pair

  1.1 Open AWS Console and select select EC2 on Compute category

  ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/prereqs01.png)

  1.2 On the left menu, on "Network & Security", select Key Pairs

  ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/prereqs02.png)

  1.3 At the top of the page, click on "Create Key Pair" button

  ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/prereqs03.png)

  1.4 Give it a name and click on "Create" button

  ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/prereqs04.png)

2. Download the CF file [here](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/aws/somecompanytest.json)

### Sample code:
You may optionally fork the code from [here](https://github.com/fellipecm/webapp-demo/) and change the git clone at app-clone on puppet/site.pp

## Utilization
### Bring up the server:

1. On AWS Console and select CloudFormation (CF) on "Management Tools" category

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use01.png)

2. Click on "Create Stack" button

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use02.png)

3. On the option "Upload a template Amazon to S3" click on "Browse..." button and select the file you downloaded as a pre-requisite

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use03.png)

4. Type a name for your Stack

5. On SSHKeyName type the Key Pair name you created as a pre-requisite

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use04.png)

6. Click on Next button twice

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use05.png)

7. Click on Create button

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use06.png)

8. Wait for it to get the "CREATE_COMPLETE" status

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use07.png)

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use08.png)

9. Get the application URL at Outputs

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use09.png)

10. Check the page

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use10.png)


### Delete the server:

1. On AWS Console open CloudFormation (CF)

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/use01.png)

2. Select the stack you have created and click on Actions > Delete Stack

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/delete01.png)

3. Click on "Yes, Delete" and wait for it to be deleted

   ![alt tag](https://raw.githubusercontent.com/fellipecm/somecompanytest/master/docs/images/delete02.png)

## References
### Sample code:

https://github.com/alexharv074/webapp-demo

### App testing and initial env setup (before Puppet):

https://rvm.io/
https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/aws/nginx/oss/install_language_runtime.html

### Puppet:

http://crohr.me/journal/2012/who-said-puppet-was-hard.html
https://forge.puppet.com/maestrodev/rvm
https://blog.csanchez.org/2014/01/14/installing-rvm-and-multiple-ruby-versions-with-puppet/
http://livecipher.blogspot.com.au/2013/01/deploy-code-from-git-using-puppet.html
http://stackoverflow.com/questions/1349047/show-pending-migrations-in-rails
https://phaseshiftllc.com/articles/2012/03/19/setting-up-vagrant-with-rvm-and-mysql-for-rails-development.html
https://mikewilliamson.wordpress.com/2015/08/26/running-a-rails-app-with-systemd-and-liking-it/
http://jsonlint.com/

### CloudFormation:

https://gist.github.com/gene1wood/a00d0b9d029f40e866df
https://github.com/Accenture/adop-docker-compose

###README:

https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

### Issues and trobleshooting:

https://github.com/flapjack/omnibus-flapjack/issues/72
https://ask.puppet.com/question/2177/how-to-execute-source-command/
http://stackoverflow.com/questions/23287357/already-activated-rake-version-different-than-what-gemfile-requires-prevents-rak
