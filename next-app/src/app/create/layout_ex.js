export default function Layout(props) {
  return (
    // 이 파일을 동작시키고자 한다면, 파일명을 layout.js로 변경시켜야한다.
    <form>
      <h2>Create</h2>
      {props.children}
    </form>
  );
}