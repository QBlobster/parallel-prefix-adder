
# Parallel-Prefix Adder: The Design of CMOS parallel-prefix VLSI Adder

**Parallel-Prefix Adder showcases the ability to achieve high-performance adder**

This program is operated by HSPICE using [90nm PTM](http://rfic.eecs.berkeley.edu/~niknejad/ee242/pdf/90nm_bulk.pm) technology at 1V power supply. It employs a parallel-prefix circuit, achieving a minimal delay time of 0.1815ns with a power consumption of 0.9593mW.

**32-bit Parallel-Prefix Adder**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/Adder32.png" width = "80%" height = "80%" alt="32-bit Parallel-Prefix Adder" align=center />

**h0 and 1<sup>st</sup> recurrence stage**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/h0_1st_rec.png" width = "60%" height = "60%" alt="32-bit Parallel-Prefix Adder" align=center />

**2<sup>nd</sup>-5<sup>th</sup> recurrence stage**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/2nd_to_5th_rec.png" width = "60%" height = "60%" alt="32-bit Parallel-Prefix Adder" align=center />

**Sum Block and 2-to-1 MUX**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/sum_mux.png" width = "40%" height = "40%" alt="32-bit Parallel-Prefix Adder" align=center />

**First Prefix-2 for Carry and Transmit(left), 2-to-1 Multiplexer(right)**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/carry_transmit_and_mux.png" width = "60%" height = "60%" alt="32-bit Parallel-Prefix Adder" align=center />

**Inverter and XNOR(XOR) Gate**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/inv_and_xnor_xor.png" width = "60%" height = "60%" alt="32-bit Parallel-Prefix Adder" align=center />

**NOR(OR) and NAND(AND) Gate**

 <img src="https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/nor_or_and_nand_and.png" width = "60%" height = "60%" alt="32-bit Parallel-Prefix Adder" align=center />

I employed the Sparse-2 design to reduce the number of gates in the carry operation (ℎ<sub>i</sub>) for the 2-bit adder. The sum is selected by pseudo-carry-in to the group. I used a five-stage approach to construct the 32-bit adder architecture. Each stage is derived using [Ling’s transformation](https://ieeexplore.ieee.org/document/1377160), which utilizes the pseudo-carry signal with factor 𝑡<sub>i</sub> and combines the pseudo-carry (𝐻<sub>i:j</sub>) and transmit (𝑇<sub>i:j</sub>), allowing for parallel prefix computation.


## Demo

![image](https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/Demo1.png)
![image](https://github.com/QBlobster/parallel-prefix-adder/blob/main/image/Demo2.png)

Demo made by [Zhe-Wei Pan](https://github.com/QBlobster)
## Installation

Ensure you have obtained the `SSH_key` and `config` from [Zhe-Wei Pan](https://github.com/QBlobster) and copied it to the following directory:

```Shell
cp SSH_KEY ~/.ssh/key/SSH_KEY
cp config ~/.ssh/key/config
```

Install **Parallel-Prefix Adder** with the following command

```Shell
git clone git@github.com:QBlobster/parallel-prefix-adder.git
```
## Usage

Make sure to start from `C shell` by `tcsh` and set the environment variable for HSPICE.

```Shell
# Change to C shell
tcsh

# set library path
source /usr/cad/synopsys/CIC/hspice.cshrc
```

You can modify the spice netlist file in `Adder32.sp` to analyze the differnet circuits.

Execute `vcs` to generate the digital waveform to verify the correctness of the parallel-prefix functionality. Next, run `hspice` to generate the waveform, measure the delay time of A<sub>0</sub> and S<sub>31</sub>, and record the power consumption:

```shell
# Simulate the functionality of 32-bit Parallel-Prefix Adder
vcs -full64 ./tb/Adder32_tb.v Adder32.v -l ./log/comp.log -debug_access+all -o Adder32 -R

# Simulate Spice-level 32-bit Parallel-Prefix Adder
hspice -i Adder32.sp -o ./lis/Adder32.lis
```

The functinal waveform result will be saved in `./func/Adder32.fsdb`. The Spice-level waveform result will be stored in `./lis/Adder32.tr0`. You can use `wv` to view the waveform, and the detailed result can be found in `./lis/Adder32.mt0`.

```Shell
cd lis

cat Adder32.mt0

    #Adder32.mt0
    ...
    t1 =  2.075e-09
    t2 =  2.257e-09
    td =  1.815e-10	#Delay Time
    power =  9.593e-04	#Power
    temper =   27.0000
```

## Contributing

Contributions are always welcome!

Please contact [Zhe-Wei Pan](https://github.com/QBlobster).


## License

[MIT](https://choosealicense.com/licenses/mit/)

