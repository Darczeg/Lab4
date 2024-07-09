git clone https://github.com/Darczeg/Lab4/Projekt1
cd project-git
git checkout -b date-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--date\" ]]; then\n  date\nfi" > skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add --date flag to display current date"
git push -u origin date-feature
git checkout main
git merge date-feature
git checkout -b gitignore-feature
echo "*log*" > .gitignore
git add .gitignore
git commit -m "Add .gitignore to ignore log files"
git push -u origin gitignore-feature
git checkout main
git merge gitignore-feature
git checkout -b logs-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--logs\" ]]; then\n  for i in {1..100}; do\n    echo \"log\$i.txt created by skrypt.sh on \$(date)\" > log\$i.txt\n  done\nfi" >> skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add --logs flag to create 100 log files"
git push -u origin logs-feature
git checkout main
git merge logs-feature
git checkout -b logs-argument-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--logs\" ]]; then\n  count=\${2:-100}\n  for i in \$(seq 1 \$count); do\n    echo \"log\$i.txt created by skrypt.sh on \$(date)\" > log\$i.txt\n  done\nfi" >> skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add argument support for --logs to specify number of log files"
git push -u origin logs-argument-feature
git checkout main
git merge logs-argument-feature
git checkout -b help-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--help\" ]]; then\n  echo \"Available options:\"\n  echo \"  --date        : Display current date\"\n  echo \"  --logs [N]    : Create N log files (default 100)\"\n  echo \"  --help        : Show this help message\"\nfi" >> skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add --help flag to display available options"
git push -u origin help-feature
git checkout main
git merge help-feature
git tag v1.0
git push origin v1.0
git checkout -b single-dash-flags-feature
echo -e "#!/bin/bash\n\ncase \$1 in\n  --date|-d)\n    date\n    ;;\n  --logs|-l)\n    count=\${2:-100}\n    for i in \$(seq 1 \$count); do\n      echo \"log\$i.txt created by skrypt.sh on \$(date)\" > log\$i.txt\n    done\n    ;;\n  --help|-h)\n    echo \"Available options:\"\n    echo \"  --date, -d        : Display current date\"\n    echo \"  --logs, -l [N]    : Create N log files (default 100)\"\n    echo \"  --help, -h        : Show this help message\"\n    ;;\nesac" > skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add single dash flags and update help"
git push -u origin single-dash-flags-feature
git checkout -b init-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--init\" ]]; then\n  git clone https://github.com/twoj-uzytkownik/project-git.git\n  export PATH=\$PATH:\$(pwd)/project-git\nfi" >> skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add --init flag to clone repo and set PATH"
git push -u origin init-feature
git checkout -b error-feature
echo -e "#!/bin/bash\n\nif [[ \$1 == \"--error\" || \$1 == \"-e\" ]]; then\n  count=\${2:-100}\n  for i in \$(seq 1 \$count); do\n    mkdir -p error\$i\n    echo \"error\$i/error\$i.txt created by skrypt.sh on \$(date)\" > error\$i/error\$i.txt\n  done\nfi" >> skrypt.sh
chmod +x skrypt.sh
git add skrypt.sh
git commit -m "Add --error and -e flag to create error files"
git push -u origin error-feature
echo "*error*" >> .gitignore
git add .gitignore
git commit -m "Update .gitignore to ignore error files"
git push
git checkout main
git pull
git rebase single-dash-flags-feature
git rebase init-feature
git rebase error-feature
git merge single-dash-flags-feature
git merge init-feature
git merge error-feature

