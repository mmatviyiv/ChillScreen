# ChillScreen

Plugin for macOS that prevents random and annoying popup of Mail's window. Make it chill.

## Requirements

**macOS Catalina**. Other versins are coming soon.

## Install

0. Make sure plugins are enabled. Run in **Terminal**:
```bash
sudo defaults write "/Library/Preferences/com.apple.mail" EnableBundles 1
```
1. Run in **Terminal**:
```bash
curl -SL \
    https://github.com/mmatviyiv/ChillScreen/releases/latest/download/ChillScreen.mailbundle.zip | \
    tar -xf - -C ~/Library/Mail/Bundles
```
2. Restart **Mail** app.
3. Click **Mail** in the menu bar, select **Preferences…**.
4. Click on **Manage Plug-ins** in the **General** tab.
5. Activate **ChillScreen.mailbundle** by checking the checkbox.
6. Click **Apply and Restart Mail**.
7. On the top-right corner of the Mail's window should appear `[Chilled]` label. Mouse hover shows its version.
8. Done.

## Uninstall

Run in **Terminal**:
```bash
rm -rf ~/Library/Mail/Bundles/ChillScreen.mailbundle
```

## Build locally

```bash
xcodebuild -configuration Debug
```

Then activate it in **Mail** app following the instruction from [Install](#Install).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
