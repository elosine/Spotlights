(
d = SoundFile.collectIntoBuffers("/Users/justin/Documents/github/Spotlights/grainEnv/" ++ "*");
f = Buffer.alloc(s, s.sampleRate*3);

SynthDef(\icy_live, {
	arg buf=0, envbuf = -1, pitchshift=1, winsz=0.8, overlaps=40, resettrig=0, startpos=0.0, endpos=1.0, rand=0.1, ratemin=2.0, ratemax=0.00001,  atk=0.05, rel=0.8, crv = -6, gate=1, width = 0.03;
	var sig, ix, krate, in, writehead, durenv,sig2;
	var amp = \amp.kr(1.0,0.03);
	durenv = EnvGen.ar(Env.asr(atk, 1, rel, curve: crv),gate,doneAction:2);
	writehead = Phasor.ar(0, BufRateScale.kr(buf), 0, BufFrames.kr(buf));
	in = BufWr.ar(SoundIn.ar(0), buf, writehead);
	krate = \rate.kr(1, 0.05).linlin(0.0, 1.0, ratemin, ratemax);
	ix = Phasor.kr(resettrig, ((1.0/ControlRate.ir)/(BufFrames.kr(buf)/SampleRate.ir))*krate, startpos, endpos);
	sig = Warp1.ar(1, buf, ix, pitchshift, winsz, envbuf, overlaps,rand);
	sig2 = DelayC.ar(sig, 0.2, width);
	Out.ar(0, [sig, sig2]*durenv*amp);
}).add;
)

x = Synth(\icy_live, [\buf, f, \winsz, 0.6, \overlaps, 17, \rand, 0.2, \envbuf, d[3],\ratemin,1, \ratemax, 0.00001, \rate, 0.01, \rel, 2, \crv, -6 ]);
x.set(\rate, 0.88, \winsz, 0.6, \overlaps, 17, \envbuf, d[0], \ratemax, 0.0000001, \ratemin, 3);
x.free;
d[8]
s.meter

//use trrand to change rate, use lfo and regularish trigger so that it decends and ascends use control bus etc
//use writehead phasor trigger to randomly trigger to other parts of the buffer so change is not so regular
//each trigger triggers a different interval to wait for next trigger