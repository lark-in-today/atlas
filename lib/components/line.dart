Widget line(String title) {
  return Container(
    padding: EdgeInsets.all(15.0),
    child: Text(title),
    decoration: BoxDecoration(
      color: Color(0xFFf9f9f9),
      border: Border.all(
        color: Color(0xffa2a2a2),
        width: 0.3,
      ),
      borderRadius: BorderRadius.circular(5.0)
    )
  );
}
