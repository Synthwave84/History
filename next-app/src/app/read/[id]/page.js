export default async function Read(props) {
  
  console.log('props', props);

  const id = props.params.id;
  const resp = await fetch(`${process.env.NEXT_PUBLIC_API_URL}topics/${id}`); // 백엔드 스프링 주소.
  const topic = await resp.json();
  
  return (
    <>
      <h2>{topic.title}</h2>
      {topic.body}
    </>
  );
}