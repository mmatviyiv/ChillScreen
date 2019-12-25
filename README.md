# ChillScreen

Plugin for macOS that prevents random and annoying Mail popups. Make it chill.

## Requirements

**macOS Catalina**. Other versins are coming soon.

## Installing

1. Run in **Terminal**
```bash
curl -SL https://github.com/mmatviyiv/ChillScreen/releases/latest/download/ChillScreen.mailbundle.zip | tar -xf - -C ~/Library/Mail/Bundles
```
2. Open **Mail** app
3. Click **Mail** in the menu bar, select **Preferences…**
4. Click on **Manage Plug-ins** in the **General** tab
5. Activate **ChillScreen.mailbundle** by checking the checkbox
6. Click **Apply and Restart Mail**
7. Done

## Build locally

```bash
xcodebuild -target Local PRODUCT_NAME=ChillScreen
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
