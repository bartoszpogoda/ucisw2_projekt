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
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="XLXN_5" />
        <signal name="XLXN_7(10:0)" />
        <signal name="XLXN_8(10:0)" />
        <signal name="XLXN_15(7:0)" />
        <signal name="XLXN_16(7:0)" />
        <signal name="XLXN_17(7:0)" />
        <signal name="PS2_Data" />
        <signal name="PS2_Clk" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55(10:0)" />
        <signal name="XLXN_56(10:0)" />
        <signal name="XLXN_58" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60(10:0)" />
        <signal name="XLXN_61" />
        <signal name="XLXN_63" />
        <signal name="XLXN_64(10:0)" />
        <signal name="XLXN_65(10:0)" />
        <signal name="XLXN_66(10:0)" />
        <signal name="XLXN_67" />
        <signal name="XLXN_69" />
        <signal name="XLXN_70(10:0)" />
        <signal name="XLXN_3(10:0)" />
        <signal name="XLXN_72(10:0)" />
        <signal name="XLXN_4(10:0)" />
        <signal name="XLXN_74(10:0)" />
        <signal name="XLXN_75" />
        <signal name="XLXN_76" />
        <signal name="XLXN_77" />
        <signal name="XLXN_78(10:0)" />
        <signal name="XLXN_79" />
        <signal name="XLXN_88" />
        <signal name="XLXN_89(10:0)" />
        <signal name="XLXN_90(10:0)" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102" />
        <signal name="XLXN_103" />
        <signal name="XLXN_104" />
        <signal name="XLXN_105(10:0)" />
        <signal name="XLXN_106" />
        <signal name="XLXN_107" />
        <signal name="XLXN_108(10:0)" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Input" name="btn_south" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="PS2_Data" />
        <port polarity="Output" name="PS2_Clk" />
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
        <blockdef name="PS2_Mouse">
            <timestamp>2018-4-26T6:24:11</timestamp>
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="player_movement">
            <timestamp>2018-5-26T15:16:5</timestamp>
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="320" x="64" y="-320" height="448" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="384" y="-300" height="24" />
            <line x2="448" y1="-288" y2="-288" x1="384" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <line x2="448" y1="96" y2="96" x1="384" />
        </blockdef>
        <blockdef name="game_controller">
            <timestamp>2018-5-26T15:7:4</timestamp>
            <rect width="320" x="64" y="-628" height="628" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <line x2="448" y1="-592" y2="-592" x1="384" />
            <line x2="448" y1="-528" y2="-528" x1="384" />
            <line x2="448" y1="-464" y2="-464" x1="384" />
            <rect width="64" x="0" y="-540" height="24" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <rect width="64" x="0" y="-476" height="24" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-220" height="24" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
        </blockdef>
        <block symbolname="vga_800x600" name="XLXI_5">
            <blockpin signalname="Clk_50MHz" name="clk50" />
            <blockpin signalname="btn_south" name="clr" />
            <blockpin signalname="VGA_HS" name="h_sync" />
            <blockpin signalname="VGA_VS" name="v_sync" />
            <blockpin signalname="XLXN_59" name="vidon" />
            <blockpin signalname="XLXN_3(10:0)" name="h_counter(10:0)" />
            <blockpin signalname="XLXN_4(10:0)" name="v_counter(10:0)" />
        </block>
        <block symbolname="PS2_Mouse" name="XLXI_10">
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin name="InitOK" />
            <blockpin signalname="XLXN_51" name="DataRdy" />
            <blockpin signalname="XLXN_15(7:0)" name="B1_Status(7:0)" />
            <blockpin signalname="XLXN_16(7:0)" name="B2_X(7:0)" />
            <blockpin signalname="XLXN_17(7:0)" name="B3_Y(7:0)" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="btn_south" name="Reset" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
        </block>
        <block symbolname="player_movement" name="XLXI_19">
            <blockpin signalname="Clk_50MHz" name="clk50" />
            <blockpin signalname="XLXN_15(7:0)" name="B1_Status(7:0)" />
            <blockpin signalname="XLXN_16(7:0)" name="B2_X(7:0)" />
            <blockpin signalname="XLXN_17(7:0)" name="B3_Y(7:0)" />
            <blockpin signalname="XLXN_51" name="DataRdy" />
            <blockpin signalname="XLXN_7(10:0)" name="player_x(10:0)" />
            <blockpin signalname="XLXN_8(10:0)" name="player_y(10:0)" />
            <blockpin signalname="XLXN_79" name="player_action_ready" />
        </block>
        <block symbolname="game_controller" name="XLXI_23">
            <blockpin signalname="XLXN_59" name="vidon" />
            <blockpin signalname="VGA_R" name="red_out" />
            <blockpin signalname="VGA_G" name="green_out" />
            <blockpin signalname="VGA_B" name="blue_out" />
            <blockpin signalname="XLXN_3(10:0)" name="h_counter(10:0)" />
            <blockpin signalname="XLXN_4(10:0)" name="v_counter(10:0)" />
            <blockpin signalname="Clk_50MHz" name="clk50" />
            <blockpin signalname="btn_south" name="reset" />
            <blockpin signalname="XLXN_51" name="DataRdy" />
            <blockpin signalname="VGA_VS" name="v_sync" />
            <blockpin signalname="XLXN_7(10:0)" name="player_x(10:0)" />
            <blockpin signalname="XLXN_8(10:0)" name="player_y(10:0)" />
            <blockpin signalname="XLXN_79" name="player_dash_ready" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="VGA_HS">
            <wire x2="2352" y1="1008" y2="1008" x1="1584" />
        </branch>
        <branch name="VGA_R">
            <wire x2="2352" y1="1136" y2="1136" x1="2336" />
        </branch>
        <branch name="VGA_G">
            <wire x2="2352" y1="1200" y2="1200" x1="2336" />
        </branch>
        <branch name="VGA_B">
            <wire x2="2352" y1="1264" y2="1264" x1="2336" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1008" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1072" name="VGA_VS" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1136" name="VGA_R" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1200" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1264" name="VGA_B" orien="R0" />
        <instance x="1200" y="1296" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_79">
            <wire x2="1824" y1="2224" y2="2224" x1="1680" />
            <wire x2="1888" y1="1648" y2="1648" x1="1824" />
            <wire x2="1824" y1="1648" y2="2224" x1="1824" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="1680" y1="1072" y2="1072" x1="1584" />
            <wire x2="2352" y1="1072" y2="1072" x1="1680" />
            <wire x2="1680" y1="1072" y2="1456" x1="1680" />
            <wire x2="1888" y1="1456" y2="1456" x1="1680" />
        </branch>
        <branch name="btn_south">
            <wire x2="608" y1="1264" y2="1264" x1="480" />
            <wire x2="896" y1="1264" y2="1264" x1="608" />
            <wire x2="1200" y1="1264" y2="1264" x1="896" />
            <wire x2="896" y1="1264" y2="1392" x1="896" />
            <wire x2="1888" y1="1392" y2="1392" x1="896" />
            <wire x2="608" y1="1264" y2="2032" x1="608" />
            <wire x2="640" y1="2032" y2="2032" x1="608" />
        </branch>
        <branch name="XLXN_4(10:0)">
            <wire x2="1888" y1="1264" y2="1264" x1="1584" />
        </branch>
        <branch name="XLXN_3(10:0)">
            <wire x2="1888" y1="1200" y2="1200" x1="1584" />
        </branch>
        <branch name="XLXN_59">
            <wire x2="1888" y1="1136" y2="1136" x1="1584" />
        </branch>
        <branch name="XLXN_17(7:0)">
            <wire x2="1232" y1="2096" y2="2096" x1="1024" />
        </branch>
        <branch name="XLXN_16(7:0)">
            <wire x2="1232" y1="2032" y2="2032" x1="1024" />
        </branch>
        <branch name="XLXN_15(7:0)">
            <wire x2="1232" y1="1968" y2="1968" x1="1024" />
        </branch>
        <branch name="PS2_Clk">
            <wire x2="1088" y1="1840" y2="1840" x1="1024" />
            <wire x2="1088" y1="1840" y2="2400" x1="1088" />
            <wire x2="2336" y1="2400" y2="2400" x1="1088" />
        </branch>
        <branch name="PS2_Data">
            <wire x2="1152" y1="1776" y2="1776" x1="1024" />
            <wire x2="1152" y1="1776" y2="2352" x1="1152" />
            <wire x2="2336" y1="2352" y2="2352" x1="1152" />
        </branch>
        <instance x="640" y="2192" name="XLXI_10" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2336" y="2352" name="PS2_Data" orien="R0" />
        <iomarker fontsize="28" x="2336" y="2400" name="PS2_Clk" orien="R0" />
        <iomarker fontsize="28" x="480" y="1264" name="btn_south" orien="R180" />
        <iomarker fontsize="28" x="496" y="1008" name="Clk_50MHz" orien="R180" />
        <instance x="1888" y="1728" name="XLXI_23" orien="R0">
        </instance>
        <branch name="XLXN_51">
            <wire x2="1200" y1="2160" y2="2160" x1="1024" />
            <wire x2="1232" y1="2160" y2="2160" x1="1200" />
            <wire x2="1200" y1="2160" y2="2288" x1="1200" />
            <wire x2="1888" y1="2288" y2="2288" x1="1200" />
            <wire x2="1888" y1="1696" y2="2288" x1="1888" />
        </branch>
        <branch name="XLXN_8(10:0)">
            <wire x2="1760" y1="1904" y2="1904" x1="1680" />
            <wire x2="1888" y1="1584" y2="1584" x1="1760" />
            <wire x2="1760" y1="1584" y2="1904" x1="1760" />
        </branch>
        <branch name="XLXN_7(10:0)">
            <wire x2="1696" y1="1840" y2="1840" x1="1680" />
            <wire x2="1872" y1="1520" y2="1520" x1="1696" />
            <wire x2="1888" y1="1520" y2="1520" x1="1872" />
            <wire x2="1696" y1="1520" y2="1840" x1="1696" />
        </branch>
        <branch name="Clk_50MHz">
            <wire x2="560" y1="1008" y2="1008" x1="496" />
            <wire x2="1088" y1="1008" y2="1008" x1="560" />
            <wire x2="1088" y1="1008" y2="1328" x1="1088" />
            <wire x2="1216" y1="1328" y2="1328" x1="1088" />
            <wire x2="1888" y1="1328" y2="1328" x1="1216" />
            <wire x2="1216" y1="1328" y2="1840" x1="1216" />
            <wire x2="1232" y1="1840" y2="1840" x1="1216" />
            <wire x2="1200" y1="1008" y2="1008" x1="1088" />
            <wire x2="560" y1="1008" y2="2096" x1="560" />
            <wire x2="640" y1="2096" y2="2096" x1="560" />
            <wire x2="560" y1="2096" y2="2160" x1="560" />
            <wire x2="640" y1="2160" y2="2160" x1="560" />
        </branch>
        <instance x="1232" y="2128" name="XLXI_19" orien="R0">
        </instance>
    </sheet>
</drawing>