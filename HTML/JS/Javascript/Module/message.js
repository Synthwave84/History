const message = () => {
    const name = "홍길동";
    const age = 100;
    return name + "은 나이가 " + age + " 세 입니다.";
};
// export  함수나 기타 등등의 자료를 외부(다른파일)에서 참조 가능하게 하는 의미.
export default message; 
