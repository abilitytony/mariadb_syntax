# 덤프파일 생성
mysqldump -u root -p 스키마명 > 덤프파일명
mysqldump -u root -p board > board_dump.sql

# 덤프파일 적용(복원)
# 아래 실행 명렁어 위치에 덤프파일이 있어야하고, 스키마는 만들어져 있어야함
mysql -u root -p 스키마명 < 덤프파일명
mysql -u root -p board < board_dump.sql

# 1)주의사항 : vscode의 인코딩을 UTF8로 설정할 필요.
# 2)< 를 인식 못할 때에는 git bash에서 작업할 필요.