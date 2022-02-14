class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  static fromJson(List<Map<String, dynamic>> json) {
    List<Album> res = [];

    json.map((value) => {
          if (value != null)
            {
              res.add(Album(
                userId: value['userId'],
                id: value['id'],
                title: value['title'],
              ))
            }
        });

    return res;
  }
}
