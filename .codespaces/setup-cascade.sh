#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo -e $PALETTE_RED"\n Do not run ./setup-cascade.sh  directly. Run script from ./init_repos.sh \n"$PALETTE_RESET
    exit 1
fi

echo -e $PALETTE_LIGHT_YELLOW"\n ⌬ Fetching the CASCADE repo\n"$PALETTE_RESET
mkdir cascade
pushd ./cascade
export CASCADE_ROOT=`pwd`
echo -e "export CASCADE_ROOT=$CASCADE_ROOT" >> ~/.cs-environment


EMPTY_STRING=""
CLEAN_ORIGIN="${CASCADE_REPO_URL/https\:\/\//$EMPTY_STRING}"

# clone the cascade repo
git clone https://PAT:$ADO_PAT@$CLEAN_ORIGIN .


echo -e $PALETTE_BLUE"\n ⌬ Restoring CASCADE Packages\n"$PALETTE_RESET
dotnet restore

popd

echo -e $PALETTE_GREEN"\n ⌬ CASCADE Setup Complete.\n"$PALETTE_RESET
