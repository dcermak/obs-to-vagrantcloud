# obs-to-vagrantcloud

This is a very simple script that either uploads or links a Vagrant box that has
been build and published in the [Open Build
Service](https://openbuildservice.org/) to [Vagrant
Cloud](https://app.vagrantup.com/).


## Prerequisites

You need a Vagrant box that is being build in the Open Build Service and
published with the repository type `vagrant` set in the project configuration.

This script itself requires ruby and the gems listed in the `gemspec`, install
these preferably via bundler:
```ShellSession
$ bundle install --path vendor
```

## Usage

First, you'll have to get the link to the json file that is produced by the Open
Build Service when publishing your Vagrant box. To obtain it, navigate to the
published repository and into the `boxes` subdirectory. It will contain at least
one `*.json` file. Find the correct one and save its URL.

Furthermore, you have to obtain an API Key for Vagrant Cloud from
https://app.vagrantup.com/settings/security and export it as the environment
variable `ATLAS_TOKEN`.

There are two possible modes of operation:
1. Linking - the box is published on Vagrant Cloud, but not uploaded there.
   Instead, vagrant will be redirected to your Open Build Service instance.
   To use this mode, add the flag `--link`

2. Upload - the box will be published and uploaded to Vagrant Cloud.

Usage:
```ShellSession
$ export ATLAS_TOKEN='YOUR_API_KEY'
$ bundle exec ./obs-to-vagrantcloud.rb --url INSERT_URL_TO_BOX_JSON --organization NAME_OF_YOUR_ORGANIZATION
```

Additional options:
- `--name NEW_BOX_NAME` Override the name of the Vagrant box.
  This can be used to specify better box names as OBS can sometimes create pretty long ones.
- `--link`: The box will only be linked to Vagrant Cloud and not uploaded there.
- `--provider PROVIDER` Only upload the specified provider and not others that
  are present in the boxes' json file.
  **NOTE** This option is not available when linking boxes! It does not really
  make sense to link individual providers, as OBS only keeps exactly those
  builds around that are mentioned in the json.

## Linking or Uploading?

The general recommendation is to upload your boxes to Vagrant Cloud if your
local Internet connection allows that. The disadvantage of linking is, that the
Open Build Service only keeps the last version rebuild of each image around. So
you must continuously run this script to ensure that Vagrant Cloud has the
latest version available, otherwise users of your box will get a 404 from time
to time.
