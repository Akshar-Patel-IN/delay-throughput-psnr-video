BEGIN {
duration = 0;
src1 = 0.0; dst1 = 3.0;
lineCount1 = 0;totalBits1 = 0;
}

$1=="+"&&$9==src1&&$10==dst1 {
    t_arr[$12] = $2;
};

$1=="r"&&$9==src1&&$10==dst1 {

    duration = $2 - t_arr[$12];
    throughput = 8*$6/duration/1e3;
    print throughput >> "throughput.txt";

 totalBits1 += 8*$6;	
    

if ( lineCount1==0 ) {

timeBegin1 = $2; lineCount1++;

} else {

timeEnd1 = $2;

};

};



END{

duration = timeEnd1-timeBegin1;

print "Transmission: source " src1 "->Destination" dst1; 

print "  - Total transmitted bits = " totalBits1 " bits";

print "  - duration = " duration " s"; 

print "  - Thoughput = "  totalBits1/duration/1e3 " kbps."; 

};
