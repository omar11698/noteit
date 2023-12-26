import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MessageShapeClipper extends CustomClipper<Path>{
  @override
  getClip(Size size) {
    var h=size.height;
    var w=size.width;
    var myPath=Path();

    ///(0,0) p1
    var p1=Offset(0, 0);
    ///(0,400) p2
    ///first curve  start point
    var p2=Offset(0, h-h*0.15);




    /// control point of the first curve
    // var firstCurveControlPoint=Offset(w*0.1,h);
    // /// end point of first curve
    // var firstCurveEndPoint=Offset(w*0.45,h-50);

    myPath.lineTo(p2.dx,p2.dy );
    // myPath.quadraticBezierTo(firstCurveControlPoint.dx, firstCurveControlPoint.dy, firstCurveEndPoint.dx, firstCurveEndPoint.dy);








    ///Second Curve Points
    ///
    /// second curve Start Point
    var secondCurveStartPoint=Offset(w*0.7, h-50);
    /// second curve End Point
    var secondCurveEndPoint=Offset(w ,h);
    /// second curve Control Point
    var secondCurveControlPoint=Offset(w-w*0.005, h-h*0.2);

    myPath.quadraticBezierTo(secondCurveControlPoint.dx, secondCurveControlPoint.dy, secondCurveEndPoint.dx, secondCurveEndPoint.dy);

    ///(0,0) p3
    var p3 = Offset(w, h);
    myPath.lineTo(p3.dx,p3.dy);

    ///(w/2, h) p4
    var p4=Offset(w, 0);
    myPath.lineTo(p4.dx,p4.dy);









    ///(w*0.75, h/2)p5
    //  myPath.quadraticBezierTo(w*0.75, h/2, w/0.9, h);
    //
    // myPath.lineTo(w, 0);

    return myPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return false;
  }
}