//COMPOSE SEVERAL SENARIOS IN SC AND THEN WORRY ABOUT CONTROL
//IRIS FOR DYNAMICS
//PATTERNS:
//////SQUIGGLES
//////ACCELERATING VERTICAL LINES
//////SOL LEWITT LIVE DRAWINGS - AUTOMATIC
//SPOTLIGHT CONTROL - PATTERNS
//////CONCENTRIC CIRCLES

/*
MAKE INITIAL VIDEOS
     bouncing
     interacting with each other
     squiggles
     dynamics
     live drawing
     set movement patterns with repetition
     physical movement
     Description of projector set up
     Set up Rehearsals and reserve lab and tech to dave

YOUTUBE
MAKE SWF INTERACTIVE
YOUSENDIT
*/


//INIT
t = NetAddr("127.0.0.1", 1231);


//TABLEAUX ONE - BOUNCING AT DIFFERENT TEMPI
(
//CREATE STATIC SPOTS
/*1*/ t.sendMsg("/mkspot", /*ix*/1, /*x*/106.0, /*y*/80.0, /*sz*/120.0, "darkorange", /*velx*/0.0, /*vely*/ 0.0 );
/*2*/ t.sendMsg("/mkspot", /*ix*/2, /*x*/319.0, /*y*/80.0, /*sz*/120.0, "springgreen", /*velx*/0.0, /*vely*/ 0.0 );
/*3*/ t.sendMsg("/mkspot", /*ix*/3, /*x*/531.0, /*y*/80.0, /*sz*/120.0, "royalblue", /*velx*/0.0, /*vely*/ 0.0 );
/*4*/ t.sendMsg("/mkspot", /*ix*/4, /*x*/754.0, /*y*/80.0, /*sz*/120.0, "violetred", /*velx*/0.0, /*vely*/ 0.0 );
/*5*/ t.sendMsg("/mkspot", /*ix*/5, /*x*/967.0, /*y*/80.0, /*sz*/120.0, "sunshine", /*velx*/0.0, /*vely*/ 0.0 );
)

(
//SET INITIAL VELOCITY-Y
/*1*/ t.sendMsg("/setvel", /*ix*/1, /*velx*/0.0, /*vely*/300.0);
/*2*/ t.sendMsg("/setvel", /*ix*/2, /*velx*/0.0, /*vely*/327.0);
/*3*/ t.sendMsg("/setvel", /*ix*/3, /*velx*/0.0, /*vely*/342.0);
/*4*/ t.sendMsg("/setvel", /*ix*/4, /*velx*/0.0, /*vely*/389.0);
/*5*/ t.sendMsg("/setvel", /*ix*/5, /*velx*/0.0, /*vely*/464.0);
)

(
//ADJUST VELOCITY-Y
/*1*/ t.sendMsg("/adjvel", /*ix*/1, /*velx*/0.0, /*vely*/600.0);
/*2*/ t.sendMsg("/adjvel", /*ix*/2, /*velx*/0.0, /*vely*/400.0);
/*3*/ t.sendMsg("/adjvel", /*ix*/3, /*velx*/0.0, /*vely*/-500.0);
/*4*/ t.sendMsg("/adjvel", /*ix*/4, /*velx*/0.0, /*vely*/800.0);
/*5*/ t.sendMsg("/adjvel", /*ix*/5, /*velx*/0.0, /*vely*/-200.0);
)

(
//STOP SPOTS
/*1*/ t.sendMsg("/setvel", /*ix*/1, /*velx*/0.0, /*vely*/0.0);
/*2*/ t.sendMsg("/setvel", /*ix*/2, /*velx*/0.0, /*vely*/0.0);
/*3*/ t.sendMsg("/setvel", /*ix*/3, /*velx*/0.0, /*vely*/0.0);
/*4*/ t.sendMsg("/setvel", /*ix*/4, /*velx*/0.0, /*vely*/0.0);
/*5*/ t.sendMsg("/setvel", /*ix*/5, /*velx*/0.0, /*vely*/0.0);
)

t.sendMsg("/rmvspot", 5);

//TABLEAUX TWO - DYNAMICS AND HITTING EACH OTHER
(
//CREATE STATIC SPOTS
/*1*/ t.sendMsg("/mkspot", /*ix*/1, /*x*/106.0, /*y*/80.0, /*sz*/120.0, "darkorange", /*velx*/0.0, /*vely*/ 0.0 );
/*2*/ t.sendMsg("/mkspot", /*ix*/2, /*x*/319.0, /*y*/80.0, /*sz*/120.0, "springgreen", /*velx*/0.0, /*vely*/ 0.0 );
/*3*/ t.sendMsg("/mkspot", /*ix*/3, /*x*/531.0, /*y*/80.0, /*sz*/120.0, "royalblue", /*velx*/0.0, /*vely*/ 0.0 );
/*4*/ t.sendMsg("/mkspot", /*ix*/4, /*x*/754.0, /*y*/80.0, /*sz*/120.0, "violetred", /*velx*/0.0, /*vely*/ 0.0 );
/*5*/ t.sendMsg("/mkspot", /*ix*/5, /*x*/967.0, /*y*/80.0, /*sz*/120.0, "sunshine", /*velx*/0.0, /*vely*/ 0.0 );
)

(
//CHANGE SIZE - FIX IN PROCESSING BY AN IF THEN - IF CLOSE TO EDGE STOP CHANGING SIZE
/*1*/ t.sendMsg("/sawon", /*ix*/1, /*minsize*/30.0, /*maxsize*/120.0, /*dur*/ 7.0);
/*1*/ t.sendMsg("/sawon", /*ix*/2, /*minsize*/30.0, /*maxsize*/120.0, /*dur*/ 9.0);
/*1*/ t.sendMsg("/sawon", /*ix*/3, /*minsize*/30.0, /*maxsize*/120.0, /*dur*/ 13.0);
/*1*/ t.sendMsg("/sawon", /*ix*/4, /*minsize*/30.0, /*maxsize*/120.0, /*dur*/ 6.0);
/*1*/ t.sendMsg("/sawon", /*ix*/5, /*minsize*/30.0, /*maxsize*/120.0, /*dur*/ 21.0);
)


(
//SET INITIAL VELOCITY-Y
/*1*/ t.sendMsg("/setvel", /*ix*/1, /*velx*/0.0, /*vely*/500.0);
/*2*/ t.sendMsg("/setvel", /*ix*/2, /*velx*/0.0, /*vely*/727.0);
/*3*/ t.sendMsg("/setvel", /*ix*/3, /*velx*/0.0, /*vely*/242.0);
/*4*/ t.sendMsg("/setvel", /*ix*/4, /*velx*/0.0, /*vely*/689.0);
/*5*/ t.sendMsg("/setvel", /*ix*/5, /*velx*/0.0, /*vely*/364.0);
)

(
//CROSS TRAFFIC
/*2*/ t.sendMsg("/setvel", /*ix*/2, /*velx*/0.0, /*vely*/727.0);
/*4*/ t.sendMsg("/setvel", /*ix*/4, /*velx*/0.0, /*vely*/689.0);
)