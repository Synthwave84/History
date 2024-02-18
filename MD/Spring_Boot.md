스프링 MVC -> 스프링 부트 마이그레이션 작업

STS 툴 버젼 선택 시 개발 JDK버전으로 변경작업

WINDOW - PREFERENCES- JAVA- INSTALLED JRES
DIALOG : ADD JDK

인코딩 설정
WINDOWS PREFERENCES
- ENC

스프링 부트 
패키징- jar > 톰캣 내장 (jsp미지원)
  - 참고 > 전통적인 (Apache 사이트)외장 톰캣 = jsp 지원.
  - jsp 및 jstl사용 : 라이브러리 추가 필요.

Boot의 maven 방식은 mybatis xml 과 pom.xml 을 제외하면 없다.

스프링 진영
: 빌드 및 라이브러리 관리도구 S/W
 - Maven :pom.xml
 - Gradle : build.gradle

기본 패키지 : com.docmall.demo
  - 기본패키지 하위로 구성하여 사용.
  com.docmall.demo 패키지명

  -com.docmall.web = 하위패키지 x > 권장하지 않음.
  -com.docmall.demo.web = 동등패키지 o

스프링 bean : 스프링 IoC컨테이너에 등록되어 사용


팀장(PL)과 팀원(개발자)의 협업시

팀장 synthwave100
 -  원격 레포지토리(기본 브랜치 : main) : 깃허브에 협업프로젝트 공유.
  : https//github.com/docomsa1000//ezen10000.git
  - token : 

개발 컴퓨터
  - 프로젝트 생성
    -> 로컬 레포지토리 생성(기본 브랜치 main)
        협업 프로젝트 기본작업 - 로컬 레포지토리 커밋
    ->  원격 레포지토리(기본브랜치 main) 소스 올리기.
        1) GIT Repositories
            spring100(main) : 로컬 레포지토리
              -Remotes
                - origin 

로컬 레포지토리와 원격 레포지토리 동기화 (sync)
  로컬에서 원격으로 push작업을 하기 위해서는 원격의 내용을 로컬이 동일하게 가지고 있어야한다.
  원격에서 pull(fetch+merge) 작업으로 로컬로 가져와 동기화를 해야함.




-> Push작업
  Pull Request -> Merge 작업
      main branch(default) + master내용이 merge(병합)
      master

팀원 synthwave84
팀장ㅇ의 원격 레포지토리를 공유 : fork

  - 팀장 원격 레포지토리 생성.

스프링 배포

클라우드 서비스 : 서버 임대 사업.

IAAS : AWS, MS Azure, Google, Oracle

AWS 
  - EC2 서비스 : 서버 임대 상품

putty - 원격 서버 관리 프로그램 : 서버 원격제어
FileZilla - SFTP, FTP 서버 프로그램 : FTP서버 파일 업로드/ 다운로드


aws 가입, 해외결제 가능 카드준비. 

spring.ppk 키페어

서버 원격접속 프로그램 
  - putty 다운


관리자(root)계정 비밀번호 변경및 로그온
$  sudo passwd root
$  1234
$  1234

관리자 로그인ㅕㅔ
$ su root
$ 1234

exit 사용

ubuntu 계정으로 복귀

~ : ubuntu 홈 디렉토리 위치

루트 디렉토리 복귀
cd /


mkdir download

apt-get update
apt-get upgrade
apt-get install unzip


winscd 프로그램으로 이동하고, ubuntu 사용자도 수정 권한주기
cd /
chmod 777 download


날짜 설정
date
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
date

오라클 11g xe
https://www.oracle.com/database/technologies/xe-prior-release-downloads.html

오라클 설치과정
https://yunamom.tistory.com/335 ( 기준 )
https://blog.naver.com/codingspecialist/221326952278 : root 비번변경 작업 참고

zip파일 압축해제 : https://changhoi.kim/posts/linux/zip-command/
unzip 파일명.zip

cd Disk1
ls
alien --scripts -d oracle*    // .rmp ->.deb 파일변환


-- 오라클 설치
dpkg --install oracle*.deb

/etc/init.d/oracle-xe configure

/var/lib/dpkg/info/oracle-xe.postinst: line 114: /sbin/chkconfig: No such file or directory
You must run '/etc/init.d/oracle-xe configure' as the root user to configure the database.

오라클 환경변수
/u01/app/oracle/product/11.2.0/xe/bin

cd ~  <ubuntu사용자의 홈 디랙토리>

ubuntu:~$ sudo vi ~/.bashrc

#아래 설정을 넣어준다.
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe 
export ORACLE_SID=XE 
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh` 
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH 
export PATH=$ORACLE_HOME/bin:$PATH


복사해서 vi에서 마우스 우클릭하면 붙이기 됨.

ubuntu:~$ source ~/.bashrc

리스너 상태확인
lsnrctl status


FTP 접속 프로그램
 - 파일질라 클라이언트(private key사용)


43.201.66.16

ubuntu


- 우분투에 jdk 1.8 설치및 환경변수 설정 : https://chucoding.tistory.com/54
sudo apt-get install openjdk-8-jdk


없는지 확인체크
$ apt search openjdk



$ sudo add-apt-repository ppa:openjdk-r/ppa
$ sudo apt-get update
$ sudo apt-get install openjdk-8-jdk


자바위치 확인
$ which java
$ readlink -f /usr/bin/java

/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

~$ sudo vi /etc/profile

환경변수 정보
export JAVA_HOME=/usr/lib/jvm/
java-8-openjdk-amd64/jre
export PATH=$JAVA_HOME/bin:$PATH
export CLASS_PATH=$JAVA_HOME/lib:$CLASS_PATH


$ source /etc/profile

java -jar ezen.jar

세션이 끊어지면 구동 중지.
백그라운드 jar 파일을 구동. 세션과 상관없이 스프링 부트 프로젝트를 실행상태.
nohup java -jar ezen.jar &



cd / 
cd www

sudo mkdir dev
cd dev
sudo mkdir upload
cd upload
sudo mkdir product

대신할 uploadPath 경로
file.dir=/www/upload/product
대신할 uploadCKPath 경로
file.ckdir=/www/upload/ckupload

우분투 재시작 혹은  중지 후 오라클 서비스가 죽었을때

sqlplus 계정 + 비번 입력후 먹통

원격터미널 : putty
sqlplus /nolog
SQL> conn sys/ as sysdba
SQL> startup