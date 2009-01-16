# Nick's Toolbox: A collection of helpful scripts

## Description
My toolbox contains scripts for various things. Most often these things involve:

 * Subversion
 * Git
 * Ubuntu
 * Ruby
 * Rails
 * Bash

## Scripts

### Manual Packages

show\_manual\_packages.sh shows all the packages on an ubuntu system that are not marked as automatic (automatic means they are a dependency). I like marking a lot of libs and things as automatic so that they are removed if they are not needed.

clean\_manual\_packages.sh will mark all the manual packages as auto. If this will cause their removal, the user is prompted to confirm.

BE CAREFUL since you may want program X and Y, but X happens to depend on Y, so Y is marked auto. Then when you remove X, Y is gone too.

Please don't run clean\_manual\_packages unless you are very familiar with ubuntu. Otherwise just run show\_manual\_packages and markauto/remove by hand.

### Stale Configs

Much like manual packages, stale configs will show and clean config files for non installed programs. It basically just runs purge on all the programs that were removed and not purged.

