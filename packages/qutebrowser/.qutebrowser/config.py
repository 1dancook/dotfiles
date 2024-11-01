# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
}

# set up the default editor to be nvim
# c.editor.command = ["st", "-e", "nvim", "{file}", "-c", "normal {line}G{column0}l"] # from a reddit comment
# c.editor.command = [ "/Applications/kitty.app/Contents/MacOS/kitty", "-1", "--hold", "nvim", "{file}", ]

c.editor.command = [
    "wezterm",
    "start",
    "--always-new-process",
    "--",
    "nvim",
    "-c",
    "normal {line}G{column0}l",
    "{file}",
]

# Set theme:
# config.source('themes/base16-tomorrow-night.config.py')
config.source("themes/city-lights-theme.py")

# possible to set per-site settings. with ... as p:

# possible to bind commands etc here. config.bind(key, command)

# load hint url current url into google website translate
config.bind(
    ";g",
    "hint links run :open -t https://translate.google.com/translate?hl=en&sl=auto&tl=en&u={hint-url}",
)
config.bind(
    "gtu", "open -t https://translate.google.com/translate?hl=en&sl=auto&tl=en&u={url}"
)


# hint links
config.bind(";f", "hint links")


config.bind(",mgp", "spawn --userscript manabatests.py")


# Shortcuts for Manaba
config.bind(
    ",mm", "open https://fukui-ut.manaba.jp/ct/home_course"
)  # open manaba course home page
config.bind(
    ",mr",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_pageadm"; e.click()',
)  # open manage resources page for current course
config.bind(
    ",mt",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_queryadm_examlist"; e.click()',
)  # open tests page for current course
config.bind(
    ",ma",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_accessinfo"; e.click()',
)  # open access information for current course
config.bind(
    ",mf",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_footprint"; e.click()',
)  # open access footprint (last acccess)
config.bind(
    ",mut",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_queryadm_upload"; e.click()',
)  # open upload test page
config.bind(
    ",mur",
    'jseval -q var e = document.querySelector("#coursename"); e.href = e + "_uploadcontents"; e.click()',
)  # open resource upload page
config.bind(
    ",ms", 'jseval -q document.querySelector("[type=submit]").click()'
)  # submit form (like update in resource page)
config.bind(
    ",mpe", "hint links run :open {hint-url}_edit"
)  # go into edit of a resource page


# these work for when editing a resource page
config.bind(
    ",mpf", 'jseval -q documentre.MULTI.querySelepath/Usetctor(".editbutton").click()'
)  # add file
# https://fukui-ut.manaba.jp/ct/course_27229_queryadm_upload

config.bind(
    ",mp1",
    'jseval -q var e = document.querySelector("#StartTime"); var d = e.value.split(" ")[0]; var nd = prompt("date", d); e.value = nd + " 8:40:00"',
)  # prompt for date, and do time for period 1
config.bind(
    ",mp2",
    'jseval -q var e = document.querySelector("#StartTime"); var d = e.value.split(" ")[0]; var nd = prompt("date", d); e.value = nd + " 10:20:00"',
)  # prompt for date, and do time for period 2
config.bind(
    ",mp3",
    'jseval -q var e = document.querySelector("#StartTime"); var d = e.value.split(" ")[0]; var nd = prompt("date", d); e.value = nd + " 12:30:00"',
)  # prompt for date, and do time for period 3
config.bind(
    ",mp4",
    'jseval -q var e = document.querySelector("#StartTime"); var d = e.value.split(" ")[0]; var nd = prompt("date", d); e.value = nd + " 14:10:00"',
)  # prompt for date, and do time for period 4
config.bind(
    ",mp5",
    'jseval -q var e = document.querySelector("#StartTime"); var d = e.value.split(" ")[0]; var nd = prompt("date", d); e.value = nd + " 15:50:00"',
)  # prompt for date, and do time for period 5


# Finalize Submission for test:
config.bind(
    ",mds", 'jseval -q document.querySelector("[type=submit]").click()'
)  # finalize submission.
config.bind(
    ",mdc",
    'jseval -q document.querySelectorAll("input.answer-button").forEach(e => {e.click()})',
)  # mark all correct
config.bind(
    ",mdm",
    'jseval -q document.querySelector("[name=action_QueryTeacher_gradedetaildone]").click()',
)  # save test

# config.bind(',mdg', 'jseval -q score = Number(document.querySelector("form > table.stdlist > tbody > tr:last-child > td + td").innerText); oneText = document.querySelectorAll("div>textarea.queryinput")[0].innerHTML; twoText = document.querySelectorAll("div>textarea.queryinput")[1].innerHTML; document.querySelector("div.bt-bottom > img").click(); document.querySelector("input#query-visible-button").click(); one = Number(prompt(oneText)); two = Number(prompt(twoText)); document.querySelector("iframe").contentWindow.document.querySelector("body#CommentText").innerText = `Writing Section Score:\n1.35 = ${one}/10\n1.36 = ${two}/10\n\nTotal Score = ${one + two + score}/46`; document.querySelector("iframe").scrollIntoView();') # for week 1 quizes.
config.bind(
    ",mdn",
    'jseval -q document.querySelector("[name=action_QueryTeacher_gradetop_nextsubmitted]").click()',
)  # next test.
config.bind(",mdg", "jseval -q markTest()")

# score = Number(document.querySelector("form > table.stdlist > tbody > tr:last-child > td + td").innerText); oneText = document.querySelectorAll("div>textarea.queryinput")[0].innerHTML; twoText = document.querySelectorAll("div>textarea.queryinput")[1].innerHTML; document.querySelector("div.bt-bottom > img").click(); document.querySelector("input#query-visible-button").click(); one = Number(prompt(oneText)); two = Number(prompt(twoText)); document.querySelector("iframe").contentWindow.document.querySelector("body#CommentText").innerText = `Writing Section Score:\n1.35 = ${one}/10\n1.36 = ${two}/10\n\nTotal Score = ${one + two + score}/66`; document.querySelector('iframe').scrollIntoView();

# document.querySelectorAll('input.answer-button').forEach(e => {e.click()}); document.querySelector('textarea.editable').value="Good!"; document.querySelector('input#query-visible-button').click()

# from before - marking a test with a comment thing.
# score = Number(document.querySelector('form > table.stdlist > tbody > tr:last-child > td + td').innerText); oneText = document.querySelectorAll('div>textarea.queryinput')[0].innerHTML; twoText = document.querySelectorAll('div>textarea.queryinput')[1].innerHTML; document.querySelector('div.bt-bottom > img').click(); document.querySelector('input#query-visible-button').click(); one = Number(prompt(oneText)); two = Number(prompt(twoText)); document.querySelector('iframe').contentWindow.document.querySelector('body#CommentText').innerText = `Writing Section Score:\n1.35 = ${one}/10\n1.36 = ${two}/10\n\nTotal Score = ${one + two + score}/66`; document.querySelector('iframe').scrollIntoView();


# for kodai attendance

# go to attendance overview
config.bind(
    ",ah",
    "jseval -q document.querySelector('a[title=\"Change Attendance Status\"]').click()",
)

# all present:
config.bind(
    ",ap",
    "jseval -q document.querySelectorAll(\"input[value='10']\").forEach(e => {e.click()})",
)

# selected as absent:
config.bind(
    ",aa",
    'jseval -q document.querySelector(".contents_2>table>tbody>tr+tr>td>div>select").value="90"; document.querySelector(".contents_2>table>tbody>tr+tr>td>div>input").click()',
)

# selected as excused:
config.bind(
    ",ae",
    'jseval -q document.querySelector(".contents_2>table>tbody>tr+tr>td>div>select").value="30"; document.querySelector(".contents_2>table>tbody>tr+tr>td>div>input").click()',
)

# next
config.bind(",an", 'jseval -q document.querySelector("#confirmSseki").click();')
# for this I made a script to do the next parts automatically with greasemonkey

# confirm
config.bind(",ac", 'jseval -q document.querySelector("#completeSseki").click();')

# back to list
config.bind(",ab", 'jseval -q document.querySelector("#back").click()')
