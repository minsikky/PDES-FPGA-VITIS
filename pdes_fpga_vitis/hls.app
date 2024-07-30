<project xmlns="com.autoesl.autopilot.project" name="pdes_fpga_vitis" top="state_buffer_kernel" enableIndexer="false">
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../cpp/main.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="cpp/constants.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/StateBuffer.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/StateBuffer.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventQueue.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventQueue.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

