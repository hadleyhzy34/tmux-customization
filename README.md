# tmux-customization

my tmux customization based on tmux, tpm, nord-tmux theme, tmux-prefix-highlight, tmux-cpu

### Demo

![[demo]](./demo.png)

### Installation

#### tmux installation

---

Mac OSX:

```sh
brew install tmux
```

Ubuntu:

```sh
sudo apt-get install tmux
```

#### nord theme installation

---

##### iterm2

###### Installation

Download the latest Nord.itermcolors file from the GitHub repository and import it:

1. Start iTerm2 and open the Preferences
2. Switch to the Profiles tab located in the topbar
3. Select the Colors tabs on the right side
4. Click on the Load Presets drop-down menu and select the Import entry
5. Import the downloaded Nord.itermcolors file and import it

##### Activation

1. Start iTerm2 and open the Preferences
2. Switch to the Profiles tab located in the topbar
3. Select the Colors tabs on the right side
4. Select an existing profile from the profile list window on the left or create a new profile
5. Click on the Load Presets drop-down menu and select Nord

reference:
[nord iterm2](https://github.com/nordtheme/iterm2)

#### tpm installation

---

````sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
````

### configuration

```sh
git clone https://github.com/hadleyhzy34/tmux-customization.git
cd tmux-customization
cp .tmux.conf ~/.tmux.conf
```

then press `<prefix>`+`space`+`I` and `<prefix>`+`space`+`R`.
