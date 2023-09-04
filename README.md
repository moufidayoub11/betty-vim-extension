# Betty Vim Extension

Betty Vim Extension is a Vim plugin, similar to the Betty VS code extension, designed to help you identify and handle Betty coding style and documentation errors and warnings in real-time. This extension is perfect for handling those tricky betty messages, offering you a seamless coding experience.

<img src="https://i.imgur.com/iEhoUfL.png" alt="Betty Extension Interface" width="100%">

## Features 🌟

In this initial release, the Betty Vim Extension offers a comprehensive set of features designed to enhance your coding experience:

- **Toggle Activation**: Easily toggle the Betty extension on and off with the shortcut `(Ctrl+a)`.

- **Error and Warning Highlights**: Make your errors and warnings stand out with distinct highlights, so you never miss them.

- **Error Details**: Get quick access to error details with messages displayed directly in the command line.

## Requirements

Before using the Betty Vim extension, ensure you have the following installed:

- Vim Editor
- [Betty Style Checker](https://github.com/alx-tools/Betty) - This extension depends on the Betty Style Checker for code analysis. Ensure it's configured on your system.

## Installation

Clone the repository to your local machine, navigate to `betty-vim-extension` and run the `./install.sh` file.
```bash
git clone https://github.com/moufidayoub11/betty-vim-extension.git && cd betty-vim-extension && ./install.sh
```

## Extension Settings

No additional configuration needed! The Betty Vim extension works seamlessly with your Vim setup.

## Release Notes 📘

### Version 1.0.0 (New)

- Initial release with basic features like error highlighting and message display.

## Known Issues

No known issues at the moment. For problems or suggestions, please report them on [GitHub Issues](https://github.com/moufidayoub/betty-vim-extension/issues).

## How to Contribute 🛠️

Contributing to this extension is a great way to improve it for everyone. Follow the steps below to get started:

### Prerequisites

- Familiarity with Vimscript
- Vim installed on your machine
- A fork of the [Betty Vim Extension repository](https://github.com/moufidayoub/betty-vim-extension)

### Steps

### Prerequisites

- Familiarity with Vimscript
- Vim installed on your machine
- A fork of the [Betty Vim Extension repository](https://github.com/moufidayoub/betty-vim-extension)

### Steps

1. **Clone Your Fork**: Clone your forked repository to your local machine.

    ```bash
    git clone https://github.com/YOUR_USERNAME/betty-vim-extension.git
    ```

2. **Navigate to the Vimscript File**: Open the project in Vim and navigate to the Vimscript file that contains the main logic.

3. **Add Your Feature or Fix**: Implement your feature or fix, adhering to the existing coding style and guidelines.

4. **Test Your Changes**: Before submitting a pull request, make sure to test your changes thoroughly.

5. **Commit and Push**: Commit your changes and push them to your forked repository.

    ```bash
    git add .
    ```
    ```bash
    git commit -m "Added new feature or fix"
    ```
    ```bash
    git push origin main
    ```

6. **Create a Pull Request**: Go to the GitHub page of your forked repository and create a new pull request.

## Contact Information

- **Email:** moufidayoub883@gmail.com
- **Discord:** moufidayoub11

## License

This project is licensed under the GPL License. See the [LICENSE](LICENSE) file for details.

---

### Technical Details for Better Understanding

#### Vimscript Functions

- `BettyToggle()`: Toggles the extension on and off. It uses the global variable `g:betty_isActive` to keep track of the state.
  
- `DisplayCurrentLineMessage()`: Displays the message for the current line if it exists. It uses the `g:betty_messages` dictionary to look up messages.

- `BettyCheckAndHighlight()`: Checks and highlights issues in the code. It writes the file and then runs the Betty Style Checker on it.

- `HandleBettyNotFound()`: Handles the case where the Betty Style Checker is not found on the system.

- `ClearOldHighlights()`: Clears old highlights and messages. It uses `g:betty_match_ids` to keep track of the highlights.

- `ParseBettyOutput()`: Parses the output from the Betty Style Checker and populates `g:betty_messages`.

- `ApplyNewHighlights()`: Applies new highlights based on `g:betty_messages`.

#### Data Structures and Algorithms

- **Dictionary**: `g:betty_messages` is a dictionary that maps line numbers to messages and their types. It is used for quick look-up.

- **Array**: `g:betty_match_ids` is an array that stores the match IDs for highlights. It is used for efficient deletion of old highlights.

#### Practical Applications

- **Real-time Feedback**: This extension provides real-time feedback, which is crucial for identifying and fixing errors quickly.
  
- **Code Quality**: By adhering to Betty coding standards, the quality of the code is improved, making it more readable and maintainable.

Feel free to reach out for any further clarifications.
