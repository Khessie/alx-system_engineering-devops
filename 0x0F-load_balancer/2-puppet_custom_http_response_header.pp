able File  8 lines (7 sloc)  250 Bytes

# Add a custom HTTP header with Puppet

file_line {'custom_header':
  ensure => present,
  path   => '/etc/nginx/sites-available/default',
  line   => '\tadd_header X-Served-By "\$hostname";',
  match  => '^\tadd_header X-Served-By "\$hostname";',
}
