Chef Environment Versioning Framework
====================

This framework uses Github and Travis to version your environments, roles and nodes - and automatically updates your chef server with the changes (if your server is accessible from the internet).

Usage:

- fork this repo
- clone your fork
- add your chef validation and client keys to the .chef directory
- edit the .chef/knife.rb as necessary

- download your chef environments, roles (FUTURE: data_bags)

```
knife download environments
knife download roles
```

After you edit, add or delete .json files; commit the changes and push.

If you have Travis service connected to your repo, it will lint the json, determine what objects have been added, changed or deleted and will automatically make the appropriate changes to your chef server.
