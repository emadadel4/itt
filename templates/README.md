<p align="center">
  <a href="#resistance-struggling-for-justice-in-an-authoritarian-world" rel="nofollow">
    <img src="https://raw.githubusercontent.com/Safouene1/support-palestine-banner/master/StandWithPalestine.svg" alt="Ceasefire Now" style="width:30%;">
  </a>
</p>

<br>

<div align="center">

<img src="https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Images/text_logo.png" width="150px" align="center" style="margin-Right: 15px; border-radius: 15px;">

## Install Tweaks Tool

ITT (Install Tweaks Tool) included most Windows 10/11 Software and Windows Tweaks & Remove Bloatwares & Windows activation

![Endpoint Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fittools-7d9fe-default-rtdb.firebaseio.com%2Fmessage.json)
#{last}
![Script size](https://img.shields.io/github/size/emadadel4/itt/itt.ps1?label=Script%20size)
<!-- ![Visitors](https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Femadadel4%2Fitt%2F&countColor=%23263759&style=flat) -->

[![itt Community](https://img.shields.io/badge/Telegram%20-Join%20Community-26A5E4?logo=telegram)](https://t.me/ittcommunity)
[![Discord](https://img.shields.io/badge/Discord-Join%20Community-5865F2?logo=discord&logoColor=white)](https://discord.gg/Twyz2Wd5fB)

[![Arabic](https://img.shields.io/badge/Arabic-red)](/locales/ar.csv) [![French](https://img.shields.io/badge/French-blue)](/locales/fr.csv) [![Turkish](https://img.shields.io/badge/Turkish-red)](/locales/tr.csv) [![Chinese](https://img.shields.io/badge/Chinese-red)](/locales/zh.csv) [![Korean](https://img.shields.io/badge/Korean-white)](/locales/ko.csv) [![German](https://img.shields.io/badge/German-red)](/locales/de.csv) [![Russian](https://img.shields.io/badge/Russian-blue)](/locales/ru.csv) [![Spanish](https://img.shields.io/badge/Spanish-red)](/locales/es.csv) [![Italian](https://img.shields.io/badge/Italian-green)](/locales/it.csv) [![Hindi](https://img.shields.io/badge/Hindi-orange)](/locales/hi.csv)

###### 📦 #{a} Apps • ⚙️ #{t} Tweaks • 🔧 #{s} Settings • 💬 #{q} Quote • 🎵 #{OST} Soundtrack • 🌐 #{loc} Localization

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&pause=1000&center=true&vCenter=true&repeat=false&width=435&lines=Launch+Anytime+Anywhere!)](https://git.io/typing-svg)

</div>

<p align="center" dir="auto">

![ITT](https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/static/Images/themes.webp)

</p>

<h2>Overview</h2>

- **🚀 Automated Installation**: Say goodbye to manual software installations. ITT automates the process, saving you time and effort.
- **⚙️ Windows Debloater**: Remove bloatware, boost performance, and customize Windows effortlessly with ITT. Optimize your system in minutes.
- **👩‍💻 Developer-Friendly**: Easy-to-use and clear documentation to add a new app or tweaks as you like, you can create a new method to download apps. Be creative. <a href="#-how-to-contribute">How to Contribute</a> or <a href="#%EF%B8%8F-youre-not-a-developer">App Request</a>
- **🎵 Soundtracks**: Enjoy listening to best music from games and movies while downloading your programs.

<h2>⚡ Usage</h2>

<h3>On Windows 10/11:</h3>
<ol>
<li>Right-click on the Start menu.</li>
<li>Choose "PowerShell" and paste any of the following commands:</li>
</ol>

> [!CAUTION]  
> **LAUNCH THE SCRIPT ONLY USING OFFICIAL COMMANDS FROM THIS REPOSITORY.**  
> **IT'S NOT PORTABLE, SO DO NOT DOWNLOAD OR RUN IT FROM ELSEWHERE.**

<pre><code>irm bit.ly/ittea | iex</code></pre>

<p>If the URL is blocked in your region try:</p>
<pre><code>irm emadadel4.github.io/itt.ps1 | iex</code></pre>
<pre><code>irm raw.githubusercontent.com/emadadel4/itt/main/itt.ps1 | iex</code></pre>

> [!NOTE]  
> All links point directly to the [itt.ps1](https://raw.githubusercontent.com/emadadel4/itt/refs/heads/main/itt.ps1)  file in this repository. You can test them in browser, make sure the link starts with https://

## ⚡ Quick Install Your Saved Apps (Run as Admin is recommended)
Example:
<pre><code>iex "& { $(irm bit.ly/ittea) } -i .\myapps.itt"</code></pre>

# 🤝 How to Contribute

### Project Structure:
```
├── itt/
│   ├── static/      > Static files (e.g., apps, settings, images, etc.)
│   ├── Initialize/  > Scripts to set up default registry keys and launch the WPF app window
│   ├── locales/     > Localization files for different languages
│   ├── scripts/     > Core functionality scripts (e.g., install, script blocks, utility scripts)
│   ├── templates/   > Template files (e.g., README.md or other templates)
│   ├── themes/      > Theme files that define the application's visual style
│   ├── xaml/        > UI elements and windows (XAML files)
│   ├── build.ps1    > Builds the project and generates the final output script
│   └── itt.ps1      > This is the script that you run using the commands above
```

1. **Make sure you have PowerShell 7 installed (recommended) for building. is available on ITT**

2. **Fork the repository and clone it using [Github desktop](https://desktop.github.com/download/). is available on ITT**

3. **Open the ITT directory in PowerShell 7 run as administrator:**

<pre><code>Set-Location "C:\Users\$env:USERNAME\Documents\Github\ITT"
</code></pre>

<ol start="4">
<li><strong>Choose what you want to add.</strong></li>
</ol>

<h3>📦 Add a New App</h3>

<pre><code>.\newApp.ps1
</code></pre>

<h3>⚙️ Add a New Tweak</h3>

<pre><code>.\newTweak.ps1
</code></pre>

> [!NOTE]  
> Ensure you understand the tweak you are adding and test it before committing.

<h3>🌐 Add your native language</h3>
<p><em>

<pre><code>.\newLocale.ps1
</code></pre>

> Edit locale.csv file using [edit-csv extension ](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv)

<h3>🎨 Create your own theme</h3>

<pre><code>.\newTheme.ps1
</code></pre>

<h3>🎵 Add a New Soundtrack</h3>

<pre><code>.\newOST.ps1
</code></pre>

<h3>📜 Add a New Quote</h3>

<pre><code>.\newQuote.ps1
</code></pre>

<h3>🛠️ Build and debug</h3>

<pre><code>.\build.ps1 -Debug
</code></pre>

> [!NOTE]  
> Test your changes before you submit the Pull Request

<br>
<br>

# 🌟 Support

**Love the project?** Show your support by clicking the ⭐ (top right) and joining our community of [stargazers](https://github.com/emadadel4/itt/stargazers)!

[![Stargazers repo roster for @emadadel4/itt](https://reporoster.com/stars/dark/emadadel4/itt)](https://github.com/emadadel4/itt/stargazers)


# Resistance Struggling for Justice in an Authoritarian World

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&pause=5000&color=F70000&width=435&lines=%23STOP_GENOCIDE!;%23StandWithPalestine)](https://git.io/typing-svg)

![luisricardo](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYmY0ZWE5cnd5djVoaG12OHVteWI0Nm1zMzlpZGtxM2JwZmNwdG9iMCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/iUNO3pXpfqiZ8JQ1Jo/giphy.gif)

Don’t hesitate to speak up and join the conversation about Palestine. In this age, each of us has a role in raising awareness. Every post or message can inspire or educate others. Don’t fear expressing yourself, as words are a powerful force to change reality. Make your platforms spaces for dialogue and contribute to creating change. Together, we raise the voices of the oppressed and work toward global justice. Let’s unite for Palestine and restore hope to those who need it.

[Donation](https://www.palestinercs.org/en/Donation)

[Other way to support (boycott)](https://boycott4.github.io/boycott/)

### Recommended videos.

<div align="left">

<div>
    <a href="https://www.youtube.com/watch?v=kx5kanvn_ug" target="blank">
      <img src="https://img.youtube.com/vi/kx5kanvn_ug/0.jpg" alt="Play Video" style="width: 200px;">
    </a>
    <a href="https://youtu.be/GTvsWLVC9QU" target="blank">
      <img src="https://img.youtube.com/vi/GTvsWLVC9QU/0.jpg" alt="Play Video" style="width: 200px;">
    </a>
    <a href="https://youtu.be/mF6B5UVupyA?list=LL" target="blank">
      <img src="https://img.youtube.com/vi/mF6B5UVupyA/0.jpg" alt="Play Video" style="width: 200px;">
    </a>
  </div>
</div>

<div align="center">
<br>
 "YouTube continues to remove recommended videos!"
</div>

<h3 align="center">
  If you can't lift the injustice, at least tell everyone about it.
  
  إذا لم تستطع رفع الظلم، فعلى الأقل أخبر الجميع عنه.
</h3>