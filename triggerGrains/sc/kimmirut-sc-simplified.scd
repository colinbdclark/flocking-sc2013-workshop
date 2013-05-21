s.boot;

(
b = [
	Buffer.read(s,"/Users/colin/code/flocking-sc2013-workshop/triggerGrains/andante.aif", 0, -1);
];
)

(
SynthDef("quadgrain", {
	arg bufNum = 0,
	    pan = -1.0,
	    pos = 0.5,
	    trate = 40,
	    motuFirstOut = 0,
	    posCrawl = 0.5,
	    rate = 0.6,
	    posWiggle = 0;

	var dur,
	    clk,
	    sound,
	    panSound,
	    bufPos;

	dur = 0.25;
	clk = Impulse.kr(trate+LFNoise1.kr(0.2,10));
	pos = Phasor.kr(0,posCrawl/SampleRate.ir,0.01,0.69,0.01) + posWiggle;
	bufPos = pos * BufDur.kr(b);
	pan = WhiteNoise.kr(0.6);
	sound = TGrains.ar(2, clk, bufNum, rate, bufPos, dur, pan, 0.1);
	panSound = Mix.ar(sound);

	Out.ar(motuFirstOut,Pan2.ar(panSound,pan));
}).load(s);
)

w = Synth.new("quadgrain",[\bufNum,b[0].bufnum,\outPan,-1.0,\motuFirstOut,0,\posCrawl,0.5,\rate,0.7]);