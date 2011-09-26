@sidewalk:#eee;
@road:#fff;

/* == DEVSEED OFFICE == */

#hq {
  polygon-fill:#ADF;
  [zoom>14] {
    line-width:3;
    line-color:#39C;
    line-opacity:1;
  }
  ::label1[zoom>14] {
    text-name:"'Development Seed'";
    text-allow-overlap:true;
    text-face-name:"PrivaThreePro Regular","DejaVu Sans Bold";
    text-fill:#333;
    text-halo-fill:fadeout(#fff,50);
    text-halo-radius:1;
    text-dx:5;
    text-size:12;
    [zoom=16] { text-dx:10; text-size:13; }
    [zoom=17] { text-dx:20; text-size:14; }
    [zoom=18] { text-dx:30; text-size:15; }
    [zoom=19] { text-dx:60; text-size:16; }
  }
}
#road-outline[GIS_ID=189767][zoom>15] { 
  /* highlight the alley */
  [zoom=16] { line-width:2; }
  [zoom>16] { line-width:3; }
  line-color:#39C;
  line-opacity:0.4;
}

/* == AREAS == */

#background { polygon-pattern-file:url(res/land.png); }

#water {
  polygon-pattern-file:url(res/water.png);
  polygon-pattern-alignment:global; 
}
/* Custom shapefile derived from water polys for shadow effect */
#water-glow {
  polygon-fill:#000;
  polygon-opacity:0.03;
}

#wood {
  polygon-pattern-file:url(res/wood.png);
}

#park,
#cemetery {
  polygon-pattern-file:url(res/park.png);
}
#cemetery::pattern {
  polygon-pattern-file:url(res/cemetery.png);
}

#building::pattern { 
  polygon-pattern-file:url(res/land.png);
}
#building::fill {
  polygon-opacity:0.2; /* darkens the pattern */
  [zoom>14] {
    line-width:0.8;
    line-opacity:0.1;
  }
}

/* == ROADS, ETC == */

#sidewalk {
  polygon-fill:#fff;
  polygon-opacity:0.4;
}

#road-outline[DESCRIPTIO='Road'],
#road-outline[DESCRIPTIO='Intersection'],
#road-outline[DESCRIPTIO='Hidden Road'] {
  line-width:2;
  line-opacity:0.05;
  ::glow1[zoom>13] { line-width:3; line-opacity:0.04; }
  ::glow2[zoom>14] { line-width:4; line-opacity:0.03; }
}
#road[DESCRIPTIO='Road'],
#road[DESCRIPTIO='Intersection'] {
  polygon-fill:@road;
  polygon-gamma:0.75;
}
#road[DESCRIPTIO='Hidden Road'] {
  polygon-pattern-file:url(res/tunnel.png);
}
#road[DESCRIPTIO='Alley'],
#road[DESCRIPTIO='Parking Lot'],
#road[DESCRIPTIO='Paved Drive'] {
  polygon-fill:@road;
  polygon-gamma:0.75;
  polygon-opacity: 0.7;
}

#rail {
  line-color:#999;
  line-dasharray:4,3;
  ::b {
    line-color:#bbb;
    line-dasharray:0,4,3,0;
  }
  [zoom<14], ::b[zoom<14] { line-width:0.4; }
  [zoom=14], ::b[zoom=14] { line-width:0.5; }
  [zoom=15], ::b[zoom=15] { line-width:0.6; }
  [zoom=16], ::b[zoom=16] { line-width:0.8; }
  [zoom=17], ::b[zoom=17] { line-width:1.2; }
  [zoom=18], ::b[zoom=18] { line-width:1.6; }
}

/* == LABELS & ICONS == */

#road-labels[TYPE='trunk'][zoom>14],
#road-labels[TYPE='primary'][zoom>14],
#road-labels[TYPE='secondary'][zoom>15],
#road-labels[TYPE='residential'][zoom>15] {
  text-face-name:"PrivaTwoPro Regular","DejaVu Sans Book";
  text-name:"[NAME]";
  text-placement:line;
  text-fill:#666;
  text-halo-fill:fadeout(#fff,50);
  text-halo-radius:1;
  [TYPE='trunk'][zoom>15] { text-size:11; }
  [TYPE='primary'][zoom>15] { text-size:11; }
}

#hoods[zoom>11] {
  text-name:"[NAME]";
  text-face-name:"PrivaThreePro Regular","DejaVu Sans Book";
  [CLASS='park'] { text-face-name:"PrivaTwoItalicPro Regular","DejaVu Sans Oblique"; }
  [CLASS='campus'] { text-face-name:"PrivaOnePro Regular","DejaVu Sans Book"; }
  text-size: 6;
  text-fill:fadeout(#444,20);
  text-placement: interior;
  text-transform: uppercase;
  text-character-spacing: 0;
  text-line-spacing: 3;
  text-halo-fill:fadeout(#fff,50);
  text-halo-radius: 1;
  text-wrap-width: 10;
  [zoom>12] {
    text-size: 8;
    text-wrap-width: 25;
    text-line-spacing: 2;
    text-character-spacing: 1;
  }
  [zoom>13] {
    text-size: 11;
    text-wrap-width: 40;
    text-line-spacing: 3;
    text-character-spacing: 2;
  }
  [zoom>14] {
    text-size: 13;
    text-wrap-width: 50;
    text-line-spacing: 4;
    text-character-spacing: 3;
  }
}

#metro-station[zoom>14][zoom<16] {
  /* one point per station at lower zooms */
  point-file:url(res/metro.png);
  point-opacity:0.9;
}
#metro-station[zoom>15] {
  /* single labels for groups of entrances */
  text-name:"[NAME]";
  text-face-name:"PrivaThreePro Regular","DejaVu Sans Bold";
  text-fill:#C65;
  text-halo-fill:fadeout(#FFF,20);
  text-halo-radius:1;
  text-wrap-width:50;
  text-allow-overlap:false;
  [zoom=16] { text-size:10; }
  [zoom=17] { text-size:12; }
  [zoom=18] { text-size:14; }
}
#metro-entrance[zoom>15] {
  /* further in, show each individual entrance */
  point-opacity:0.9;
  [LINE='red'] {
    point-file:url(res/metro-r.png); }
  [LINE='orange'] {
    point-file:url(res/metro-o.png); }
  [LINE='yellow'] {
    point-file:url(res/metro-y.png); }
  [LINE='green'] {
    point-file:url(res/metro-g.png); }
  [LINE='blue'] {
    point-file:url(res/metro-b.png); }
  [LINE='green,yellow'], [LINE='green, yellow'] {
    point-file:url(res/metro-yg.png); }
  [LINE='blue, orange'] {
    point-file:url(res/metro-ob.png); }
  [LINE='red, green, yellow'] {
    point-file:url(res/metro-ryg.png); }
  [LINE='red, blue, orange'] {
    point-file:url(res/metro-rob.png); }
  [LINE='green, yellow, orange, blue'] {
    point-file:url(res/metro-oygb.png); }
}

#bus-stop[zoom>16] {
  point-opacity:0.6;
  point-file:url(../project/devseed-hq/res/bus.png);
}

#cabi[zoom>14] {
  /* Capital Bikeshare stations */
  text-name:"'cb'";
  text-face-name:"Function Pro Demi","DejaVu Sans Book";
  text-fill:fadeout(#FE0,10);
  text-halo-fill:fadeout(#E10,20);
  text-halo-radius:1;
  text-character-spacing:1;
  [zoom=15] { text-size:10; }
  [zoom=16] { text-size:11; }
  [zoom>16] { text-size:12; }
}