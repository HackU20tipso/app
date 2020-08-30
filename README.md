<<<<<<< HEAD
=======

>>>>>>> 4de0015a824615a822c342203939002a0ca2a860
## addする時

1. git add -p 追加するファイル
2. y/nを判断して答える

## git switch masterできない時

1. git stashする

## storyboardを追加する時

1. 自分のブランチでstoryboard追加
2. add/commit/push
3. git diff　で出てきたファイル　
→　例)--- a/tips-o.xcodeproj/project.pbxproj
     +++ b/tips-o.xcodeproj/project.pbxproj
4. 例) git add tips-o.xcodeproj/project.pbxproj
   で追加されていなかったファイルを追加
5. commit/push
6. 画面上で作業
7. いろいろ終わったらmasterをpull
　　→  git switch master
      git pull
8. 今まで使っていたブランチを消す&ブランチを作る
    git switch -c 新しいブランチ
    git branch -d 古いブランチ

