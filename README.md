# BMW i3 controller

**Very much a work in progress.**

The i3 is a cool car, and the app's not bad. But we can do better.

# Design goals

This is a self-hosted service (on your desktop computer or a server) that *monitors*
your car in ConnectedDrive, *notifies* you of any significant change in circumstance,
proactively *acts* upon your pre-determined instructions, and *reports* useful
information on demand.

**Monitor**: Fetch and store ConnectedDrive data. Extract useful information like state
of charge, location, and door/window lock status. Intelligently determine things
like charging session progress.

**Notify**: In cases such as you forgetting to charge your car at work, leaving the
doors unlocked, or a public charger session being disconnected early, notify you
immediately.

**Act**: Given a set of instructions, send actions to the car, such as preconditioning
based on events in your calendar.

**Report**: On demand, produce tables and charts from stored information.

## Current status

Working on the *monitor* aspect right now. Since no public spec is provided for the
ConnectedDrive API, the focus is on retrieving as much data as possible and working
out what possible values are returned.

All raw data from ConnectedDrive is stored so that future versions can retroactively
re-parse and analyse historical information.

# Installation and usage

**NB: At the moment, this service is only of interest to developers. More useful features to come.**

You have to run this on your own machine. I don't want your BMW credentials.

When the server is running, it will fetch and store data from ConnectedData every five minutes.
You can access a basic interface at http://localhost:8080 to see what it's saved so far.

## The Docker way

First, [get Docker](https://www.docker.com/community-edition). Then, from the root folder
of this project, run:

```bash
docker-compose up -d --build
```

After that, find out the container ID of `bmwi3_web` using `docker ps` and `docker attach [CID]`
to get to the `bash` prompt.

You'll need to create a configuration file with your BMW ConnectedDrive credentials. Make a new
file named  `Config/secrets/connecteddrive.json` (creating the `secrets` folder along the way)
with the following content:

```json
{
  "host": "https://www.bmw-connecteddrive.com",
  "username": "YOUR_EMAIL",
  "password": "YOUR_PASSWORD",
  "vin": "YOUR_FULL_VIN",
  "timezone": "Country/City"
}
```

Now start the server with:

```bash
swift run
```

To stop it again, open a new terminal window and run `docker-compose down`.

## The non-Docker way

It's harder.

# Suggestions, contributions, improvements

I'm very interested in taking suggestions from the community. If there's a feature you'd like
added, please create a [GitHub issue](https://github.com/bygri/bmw-i3/issues/new) for it.

If you are running the server, and see red error text appear, that probably means ConnectedDrive
has sent a response I haven't seen yet. Please copy and paste the message into a GitHub issue
so I can account for it.

## BMW employees

Please don't lock me out.
