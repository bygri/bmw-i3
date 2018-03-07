# BMW i3 controller

**Very much a work in progress**

The i3 is a cool car, and the app's OK. But we can do better.

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

You have to run this on your own machine. I don't want your BMW credentials.

