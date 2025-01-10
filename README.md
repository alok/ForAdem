# ForAdem

## Install

All the LeanCopilot related steps are *not* necessary. `uv` install is for LeanCopilot, so if you run into issues, just ignore it. If that happens, you'll have to comment out the line `import LeanCopilot` in `Main.lean`.

```bash
# install uv
# in command line
curl -LsSf https://astral.sh/uv/install.sh | sh
# add uv to your PATH. Ask GPT if you don't know how to do this or what that means.
# in command line
brew install git-lfs
uv tool install uvicorn # make sure wherever `uv` installs this to is in your PATH
# in command line
git clone https://github.com/lean-dojo/ForAdem.git
cd ForAdem
lake update && lake build
lake exe cache get
lake exe LeanCopilot/download
# in command line, in new terminal tab (so it can run in the background)
cd .lake/packages/LeanCopilot/python/uvicorn && server:app --port 23337
```

```bash
# to run without LeanCopilot.
git clone https://github.com/alok/ForAdem.git
cd ForAdem
lake update && lake build
lake exe cache get
```

ask for help on zulip
