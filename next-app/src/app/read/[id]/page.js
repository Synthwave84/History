export default function Read(props) {
  
  console.log('props', props);

  return (
    <>
      <h2>Read</h2>
      parameter: {props.params.id}
    </>
  );
}