import 'package:flutter/material.dart';

const Color spaceColor = Color(0xFF210535);

const double gameWidth = 1080.0;
const double gameHeight = 1920.0;

const double obstacleSizex = 180.0;
const double obstacleSizey = 192.0;

const double obstacleSize = 192.0;

const double extendedheight = gameHeight * 2;
const double extendedWidth = gameWidth * 2;




// children.whereType<Obstacle>().forEach((obstacle) {
//       obstacle.position.x -= (dt * 200);

//       if (obstacle.position.x < -(gameRef.size.x / 2)) {
//         // obstacle.position.y = -gameRef.size.y / 2;

//         print(true);
//         obstacle.position.x = gameRef.size.x / 2;
//       }
//     });



   // children.whereType<ObstacleRock>().forEach((obstacle) {
    //   obstacle.position.x += (dt * 300);

    //   if (obstacle.position.x > (gameRef.size.x)) {
    //     // obstacle.position.y = -gameRef.size.y / 2;
    //     obstacle.position.x = -extendedWidth;
    //   }
    // });