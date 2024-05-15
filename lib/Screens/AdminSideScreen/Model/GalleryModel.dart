class GalleryModel{
  final String galleryImage;
  final String id;

  GalleryModel( {
    required this.galleryImage,
    required this.id,
  });

  Map<String , dynamic> toMap(){
    return {
      "image": galleryImage,
      "id" : id
    };
  }
}