within WasteWater.ASM1;
model BSM1
  nitri tank3
    annotation (Placement(transformation(extent={{-54,-26},{-34,-6}})));
  nitri tank4 annotation (Placement(transformation(extent={{-24,-26},{-4,-6}})));
  nitri tank5 annotation (Placement(transformation(extent={{4,-26},{24,-6}})));
  deni tank2 annotation (Placement(transformation(extent={{-84,-26},{-64,-6}})));
  deni tank1
    annotation (Placement(transformation(extent={{-110,-26},{-90,-6}})));
  WWSource wWSource
    annotation (Placement(transformation(extent={{-164,-16},{-144,4}})));
  SecClarModTakacs Settler
    annotation (Placement(transformation(extent={{66,-30},{92,-2}})));
  divider2 divider
    annotation (Placement(transformation(extent={{36,-26},{56,-6}})));
  blower blower1
    annotation (Placement(transformation(extent={{-56,-96},{-36,-76}})));
  blower blower2
    annotation (Placement(transformation(extent={{-26,-96},{-6,-76}})));
  blower blower3
    annotation (Placement(transformation(extent={{4,-90},{24,-70}})));
  Modelica.Blocks.Continuous.PI PI1(k=25, T=0.002)
    annotation (Placement(transformation(extent={{10,78},{30,98}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-34,78},{-14,98}})));
  Modelica.Blocks.Sources.Step OxygenSetpoint(height=1.5)
    annotation (Placement(transformation(extent={{-96,78},{-76,98}})));
  pump ReturnPump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={60,-44})));
  pump RecyclePump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={34,-32})));
  sensor_O2 sensor_O2_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-10,66})));
  sensor_NO sensor_NO1
    annotation (Placement(transformation(extent={{-126,22},{-106,42}})));
  Modelica.Blocks.Sources.Step NitrogenSetpoint(height=1.5)
    annotation (Placement(transformation(extent={{-160,44},{-140,64}})));
  Modelica.Blocks.Math.Feedback feedback1
    annotation (Placement(transformation(extent={{-106,44},{-86,64}})));
  Modelica.Blocks.Continuous.PI PI2(T=0.025, k=10000)
    annotation (Placement(transformation(extent={{-56,44},{-36,64}})));
  Modelica.Blocks.Sources.Constant Constant2(k=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={38,-66})));
  pump WastePump annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={112,-18})));
  SludgeSink WasteSludge
    annotation (Placement(transformation(extent={{142,-26},{162,-6}})));
  EffluentSink Effluent
    annotation (Placement(transformation(extent={{146,6},{166,26}})));
  Modelica.Blocks.Sources.Constant Temperature(k=15) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-162,22})));
  Modelica.Blocks.Sources.Constant Constant1(k=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-126,-88})));
  Modelica.Blocks.Sources.CombiTimeTable CombiTableTime(
    tableOnFile=("Inf_dry") <> "NoName",
    columns=integer(({2,3,4,5,6,7,8,9,10,11,12,13,14,15})),
    tableName="inf_dry",
    fileName=
        "M:/Documents/Dymola/WasteWater-2.1.0/WasteWater-2.1.0/WasteWater 2.1.0/ASM1/Inf_dry.txt")
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-186,-6})));
  mixer3 mixer
    annotation (Placement(transformation(extent={{-140,-26},{-120,-6}})));
equation
  connect(tank1.Out, tank2.In) annotation (Line(
      points={{-90,-16},{-84,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(tank2.Out, tank3.In) annotation (Line(
      points={{-64,-16},{-54,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(tank3.Out, tank4.In) annotation (Line(
      points={{-34,-16},{-24,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(tank4.Out, tank5.In) annotation (Line(
      points={{-4,-16},{4,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(tank5.Out, divider.In) annotation (Line(
      points={{24,-16},{22,-16},{22,-15.7},{36,-15.7}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(divider.Out1, Settler.Feed) annotation (Line(
      points={{56,-13.4},{56,-14.04},{66,-14.04}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(blower1.AirOut, tank3.AirIn) annotation (Line(
      points={{-47,-76},{-44,-76},{-44,-25.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(blower2.AirOut, tank4.AirIn) annotation (Line(
      points={{-17,-76},{-14,-76},{-14,-25.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(blower3.AirOut, tank5.AirIn) annotation (Line(
      points={{13,-70},{14,-70},{14,-25.8}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(OxygenSetpoint.y, feedback.u1) annotation (Line(
      points={{-75,88},{-32,88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback.y, PI1.u) annotation (Line(
      points={{-15,88},{8,88}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI1.y, blower3.u) annotation (Line(
      points={{31,88},{130,88},{130,-83},{23.8,-83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor_O2_1.In, tank5.MeasurePort) annotation (Line(
      points={{-10,76},{8,76},{8,6},{19.5,6},{19.5,-11.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(sensor_O2_1.So, feedback.u2) annotation (Line(
      points={{-19.8,66},{-24,66},{-24,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sensor_NO1.In, tank2.MeasurePort) annotation (Line(
      points={{-116,22},{-68.5,22},{-68.5,-11.5}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(divider.Out2, RecyclePump.In) annotation (Line(
      points={{56,-17.5},{60,-17.5},{60,-28.7},{44,-28.7}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(sensor_NO1.Sno, feedback1.u2) annotation (Line(
      points={{-106.2,32},{-96,32},{-96,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(NitrogenSetpoint.y, feedback1.u1) annotation (Line(
      points={{-139,54},{-104,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(feedback1.y, PI2.u) annotation (Line(
      points={{-87,54},{-58,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PI2.y, RecyclePump.u) annotation (Line(
      points={{-35,54},{118,54},{118,-34.5},{42.9,-34.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Settler.Return, ReturnPump.In) annotation (Line(points={{75.1,-29.44},
          {73.55,-29.44},{73.55,-40.7},{70,-40.7}}, smooth=Smooth.None));
  connect(Constant2.y, ReturnPump.u) annotation (Line(
      points={{49,-66},{78,-66},{78,-46.5},{68.9,-46.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Settler.Waste, WastePump.In) annotation (Line(
      points={{82.9,-29.44},{93.45,-29.44},{93.45,-21.3},{102,-21.3}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(WastePump.Out, WasteSludge.In) annotation (Line(
      points={{122,-15.2},{132,-15.2},{132,-17.2},{142,-17.2}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(WastePump.u, ReturnPump.u) annotation (Line(
      points={{103.1,-15.5},{103.1,-54},{80,-54},{80,-46.5},{68.9,-46.5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Settler.Effluent, Effluent.In) annotation (Line(
      points={{92.26,-8.02},{92.26,18},{146,18}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(Temperature.y, tank1.T) annotation (Line(
      points={{-151,22},{-138,22},{-138,6},{-116,6},{-116,-12},{-110,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tank2.T, tank1.T) annotation (Line(
      points={{-84,-12},{-86,-12},{-86,0},{-114,0},{-114,-12},{-110,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tank3.T, tank1.T) annotation (Line(
      points={{-54,-12},{-56,-12},{-56,0},{-114,0},{-114,-12},{-110,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tank4.T, tank1.T) annotation (Line(
      points={{-24,-12},{-28,-12},{-28,0},{-114,0},{-114,-12},{-110,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tank5.T, tank1.T) annotation (Line(
      points={{4,-12},{4,0},{-114,0},{-114,-12},{-110,-12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Constant1.y, blower1.u) annotation (Line(
      points={{-115,-88},{-68,-88},{-68,-102},{-36.2,-102},{-36.2,-89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(blower2.u, blower1.u) annotation (Line(
      points={{-6.2,-89},{-2,-89},{-2,-102},{-36.2,-102},{-36.2,-89}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wWSource.data,CombiTableTime. y) annotation (Line(
      points={{-163,-6},{-175,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wWSource.Out, mixer.In1) annotation (Line(
      points={{-144.2,-13},{-142.1,-13},{-142.1,-12.5},{-140,-12.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(RecyclePump.Out, mixer.In2) annotation (Line(
      points={{24,-34.8},{-66,-34.8},{-66,-30},{-152,-30},{-152,-16.5},{-140,
          -16.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(ReturnPump.Out, mixer.In3) annotation (Line(
      points={{50,-46.8},{-56,-46.8},{-56,-46},{-148,-46},{-148,-20.5},{-140,
          -20.5}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(mixer.Out, tank1.In) annotation (Line(
      points={{-120,-16.4},{-116,-16.4},{-116,-16},{-110,-16}},
      color={0,0,0},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics));
end BSM1;
