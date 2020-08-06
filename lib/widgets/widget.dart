import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/views/image_view.dart';

Widget brandName(){
  return Center(
    child: RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),
        children: <TextSpan>[
          TextSpan(text: 'Wallpaper', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
          TextSpan(text: 'Hub', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
        ],
      ),
    ),
  );
}

Widget wallpapersList(List<WallpaperModel> wallpapers,context){
  return Container(
    child: GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
      childAspectRatio: 0.6,
      padding: EdgeInsets.symmetric(horizontal: 8),
      mainAxisSpacing: 6.0,
     crossAxisSpacing: 5.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>ImageView(
                      imgUrl: wallpaper.src.portrait,
                    )));
              },
              child: Hero(
                tag: wallpaper.src.portrait,
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(wallpaper.src.portrait,fit: BoxFit.cover,)),
                ),
              ),
            ),
        );
      }).toList(),
    ),
  );
}