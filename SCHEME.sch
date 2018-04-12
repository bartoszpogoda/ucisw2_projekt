<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Clk_50MHz" />
        <signal name="btn_south" />
        <signal name="XLXN_3(10:0)" />
        <signal name="XLXN_4(10:0)" />
        <signal name="led(0)">
        </signal>
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="led(7:0)" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Input" name="btn_south" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="led(7:0)" />
        <blockdef name="vga_800x600">
            <timestamp>2018-4-12T7:55:49</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="vga_pixel">
            <timestamp>2018-4-12T7:55:56</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="vga_800x600" name="XLXI_5">
            <blockpin signalname="Clk_50MHz" name="clk50" />
            <blockpin signalname="btn_south" name="clr" />
            <blockpin signalname="VGA_HS" name="h_sync" />
            <blockpin signalname="VGA_VS" name="v_sync" />
            <blockpin signalname="led(0)" name="vidon" />
            <blockpin signalname="XLXN_3(10:0)" name="h_counter(10:0)" />
            <blockpin signalname="XLXN_4(10:0)" name="v_counter(10:0)" />
        </block>
        <block symbolname="vga_pixel" name="XLXI_6">
            <blockpin signalname="led(0)" name="vidon" />
            <blockpin signalname="XLXN_3(10:0)" name="h_counter(10:0)" />
            <blockpin signalname="XLXN_4(10:0)" name="v_counter(10:0)" />
            <blockpin signalname="VGA_R" name="red_out" />
            <blockpin signalname="VGA_G" name="green_out" />
            <blockpin signalname="VGA_B" name="blue_out" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Clk_50MHz">
            <wire x2="1200" y1="1008" y2="1008" x1="1008" />
        </branch>
        <branch name="btn_south">
            <wire x2="1200" y1="1264" y2="1264" x1="1008" />
        </branch>
        <iomarker fontsize="28" x="1008" y="1008" name="Clk_50MHz" orien="R180" />
        <iomarker fontsize="28" x="1008" y="1264" name="btn_south" orien="R180" />
        <branch name="XLXN_3(10:0)">
            <wire x2="1600" y1="1200" y2="1200" x1="1584" />
            <wire x2="1888" y1="1200" y2="1200" x1="1600" />
        </branch>
        <branch name="XLXN_4(10:0)">
            <wire x2="1600" y1="1264" y2="1264" x1="1584" />
            <wire x2="1888" y1="1264" y2="1264" x1="1600" />
        </branch>
        <branch name="led(0)">
            <wire x2="1744" y1="1136" y2="1136" x1="1584" />
            <wire x2="1888" y1="1136" y2="1136" x1="1744" />
            <wire x2="1744" y1="1136" y2="1472" x1="1744" />
            <wire x2="1824" y1="1472" y2="1472" x1="1744" />
            <wire x2="1824" y1="1472" y2="1488" x1="1824" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="2352" y1="1008" y2="1008" x1="1584" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="2352" y1="1072" y2="1072" x1="1584" />
        </branch>
        <branch name="VGA_R">
            <wire x2="2352" y1="1136" y2="1136" x1="2272" />
        </branch>
        <branch name="VGA_G">
            <wire x2="2352" y1="1200" y2="1200" x1="2272" />
        </branch>
        <branch name="VGA_B">
            <wire x2="2352" y1="1264" y2="1264" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1008" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1072" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1136" name="VGA_R" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1200" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1264" name="VGA_B" orien="R0" />
        <branch name="led(7:0)">
            <wire x2="1824" y1="1584" y2="1584" x1="1728" />
            <wire x2="1904" y1="1584" y2="1584" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1904" y="1584" name="led(7:0)" orien="R0" />
        <bustap x2="1824" y1="1584" y2="1488" x1="1824" />
        <instance x="1200" y="1296" name="XLXI_5" orien="R0">
        </instance>
        <instance x="1888" y="1296" name="XLXI_6" orien="R0">
        </instance>
    </sheet>
</drawing>