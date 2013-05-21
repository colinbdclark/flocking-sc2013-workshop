fluid.registerNamespace("demo.kimmirut");

demo.kimmirut.synthDef = {
    id: "granulator",
    ugen: "flock.ugen.triggerGrains",
    trigger: {
        ugen: "flock.ugen.impulse",
        rate: "control",
        freq: {
            id: "left-trate",
            ugen: "flock.ugen.lfNoise",
            rate: "control",
            options: {
                interpolation: "linear"
            },
            freq: 0.2,
            mul: 10,
            add: 40
        }
    },
    buffer: {
        id: "grainBuffer",
        url: "../andante.aif"
    },
    centerPos: {
        ugen: "flock.ugen.phasor",
        rate: "control",
        step: {
            id: "left-posCrawl",
            ugen: "flock.ugen.math",
            source: {
                ugen: "flock.ugen.sampleRate"
            },
            div: 0.5
        },
        start: 0.01,
        end: 0.69,
        reset: 0.01,
        mul: {
            ugen: "flock.ugen.bufferDuration",
            rate: "constant",
            buffer: "grainBuffer"
        }
    },
    dur: 0.25,
    amp: 0.1,
    speed: 1.0,
    mul: 3.0
};
