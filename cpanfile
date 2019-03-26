requires "Function::Parameters" => "2.001003";
requires "Import::Into" => "1.002005";
requires "Moo" => "2.000001";
requires "Try::Tiny" => "0.30";
requires "Type::Tiny" => "1.000005";
requires "perl" => "v5.14.0";

on 'test' => sub {
  requires "Function::Parameters" => "2.001003";
  requires "Import::Into" => "1.002005";
  requires "Moo" => "2.000001";
  requires "Try::Tiny" => "0.30";
  requires "Type::Tiny" => "1.000005";
  requires "perl" => "v5.14.0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
