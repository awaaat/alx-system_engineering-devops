# Configure SSH client to use private key ~/.ssh/school and disable password authentication

package { 'ssh':
  ensure => installed,
}

file { '/home/ubuntu/.ssh':
  ensure => directory,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0700',
}

file { '/home/ubuntu/.ssh/config':
  ensure => file,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0600',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}
