# ZCS Angular Project Template

Template project that you can use to start a new Angular application.

## How to use this template

### 0. Create your project using this repository as template

You can create a new repository using this one as template directly into GitHub.

Alternatively, you can clone the project locally and reset the git configuration:

```bash
git clone git@github.com:zcsadmin/template-project-angular.git my-new-angular-app
cd my-new-angular-app
rm -rf .git
git init
```

At this point you need to substitute some placeholder configuration in the `docker-compose.yml` file.

Change the value of `CHANGEME` strings with appropriate values, ie your application short name.
For example, you can replace the string `CHANGEME` with `my-app`.

### 1. Run the main container and access the shell

The `run.sh` script will take care of managing the running containers for you.

To setup the docker environment and access the `app` container, you should run:

```bash
./run.sh -s
```

### 2. Create new angular application

When inside the `app` container, we could finally create our new application.

First, remove the `.gitkeep` file.

```bash
rm .gitkeep
```

Optionally, you can disable google analytics globally:

```bash
ng analytics off -g
```

Then, run the command that create your new angular application code:

```bash
ng new --directory . -g --style scss --defaults my-new-angular-app
```

### 3. Run your application

Exit the `app` container and go back to your system shell.

Run the application with:

```bash
./run.sh
```

When ready, you can access the application with your browser at [localhost:4200](http://localhost:4200).

## Support

[Michele Mondelli](mailto:m.mondelli@zcscompany.com)
