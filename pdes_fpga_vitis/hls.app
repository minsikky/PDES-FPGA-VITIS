<project xmlns="com.autoesl.autopilot.project" name="pdes_fpga_vitis" top="lpcore_top" enableIndexer="false">
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../cpp/main.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="cpp/sys_defs.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/constants.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/VirtualLP.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/VirtualLP.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/StateBuffer.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/StateBuffer.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/RollbackControl.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/RollbackControl.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPMapping.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPMapping.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPCoreControl.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPCoreControl.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPCore.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LPCore.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LFSR_PRNG.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/LFSR_PRNG.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventRouter.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventRouter.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventQueue.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventQueue.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventProcessor.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/EventProcessor.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/CommitControlDummy.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/CommitControlDummy.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/CancellationUnit.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="cpp/CancellationUnit.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

