//COMPOSE SEVERAL SENARIOS IN SC AND THEN WORRY ABOUT CONTROL
//IRIS FOR DYNAMICS
//PATTERNS:
//////SQUIGGLES
//////ACCELERATING VERTICAL LINES
//////SOL LEWITT LIVE DRAWINGS - AUTOMATIC
//SPOTLIGHT CONTROL - PATTERNS
//////CONCENTRIC CIRCLES


//INIT
t = NetAddr("127.0.0.1", 1231);

//CREATE STATIC SPOTS
/*1*/ t.sendMsg("/mkspot", /*ix*/1, /*x*/106.0, /*y*/80.0, /*sz*/120.0, "darkorange", /*velx*/0.0, /*vely*/ 0.0 );
/*2*/ t.sendMsg("/mkspot", /*ix*/2, /*x*/319.0, /*y*/80.0, /*sz*/120.0, "springgreen", /*velx*/0.0, /*vely*/ 0.0 );
/*3*/ t.sendMsg("/mkspot", /*ix*/3, /*x*/531.0, /*y*/80.0, /*sz*/120.0, "royalblue", /*velx*/0.0, /*vely*/ 0.0 );
/*4*/ t.sendMsg("/mkspot", /*ix*/4, /*x*/754.0, /*y*/80.0, /*sz*/120.0, "violetred", /*velx*/0.0, /*vely*/ 0.0 );
/*5*/ t.sendMsg("/mkspot", /*ix*/5, /*x*/967.0, /*y*/80.0, /*sz*/120.0, "sunshine", /*velx*/0.0, /*vely*/ 0.0 );

//SET INITIAL VELOCITY-Y
/*1*/ t.sendMsg("/setvel", /*ix*/1, /*velx*/0.0, /*vely*/100.0);
/*2*/ t.sendMsg("/setvel", /*ix*/2, /*velx*/0.0, /*vely*/100.0);
/*3*/ t.sendMsg("/setvel", /*ix*/3, /*velx*/0.0, /*vely*/100.0);
/*4*/ t.sendMsg("/setvel", /*ix*/4, /*velx*/0.0, /*vely*/100.0);
/*5*/ t.sendMsg("/setvel", /*ix*/5, /*velx*/0.0, /*vely*/100.0);

//ADJUST VELOCITY-Y
/*1*/ t.sendMsg("/adjvel", /*ix*/1, /*velx*/0.0, /*vely*/400.0);
/*2*/ t.sendMsg("/adjvel", /*ix*/2, /*velx*/0.0, /*vely*/300.0);
/*3*/ t.sendMsg("/adjvel", /*ix*/3, /*velx*/0.0, /*vely*/100.0);
/*4*/ t.sendMsg("/adjvel", /*ix*/4, /*velx*/0.0, /*vely*/100.0);
/*5*/ t.sendMsg("/adjvel", /*ix*/5, /*velx*/0.0, /*vely*/100.0);

t.sendMsg("/rmvspot", 5);