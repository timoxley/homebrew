require 'formula'

# Require ec2-api-tools to get the base class
require "#{File.dirname __FILE__}/ec2-api-tools.rb"

class AwsIamTools < AmazonWebServicesFormula
  # No stable build yet
  head 'http://awsiammedia.s3.amazonaws.com/public/tools/cli/latest/IAMCli.zip'
  homepage 'http://developer.amazonwebservices.com/connect/entry.jspa?externalID=4143&categoryID=322'
  md5 '24454ac0bc1db5196add524ac4cdcb3d'

  def install
    standard_install
  end

  def caveats
    <<-EOS.undent
      Before you can use these tools you must export some variables to your $SHELL
      and create a file containing your aws credentials.

      You can access your AWS access ID and AWS secret key:
      http://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key

      You must create the file $HOME/.aws-credentials-master, here is a template:

      # Enter the AWS Keys without the < or >
      # You can either use the AWS Accounts access keys and they can be found at
      # http://aws.amazon.com under Account->Security Credentials
      # or you can use the access keys of a user created with IAM
      AWSAccessKeyId=<Write your AWS access ID>
      AWSSecretKey=<Write your AWS secret key>

      To preserve your credentials don't forget to:
      chmod 600 $HOME/.aws-credentials-master

      To export the needed variables, add them to your dotfiles.
        * On Bash, add them to `~/.bash_profile`.
        * On Zsh, add them to `~/.zprofile` instead.
      export JAVA_HOME="/Library/Java/Home/"
      export AWS_IAM_HOME="#{prefix}/jars"
      export AWS_CREDENTIAL_FILE=$HOME/.aws-credentials-master
    EOS
  end
end
