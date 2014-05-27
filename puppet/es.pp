# yumrepo { 'elasticsearch_repo':
#     baseurl => 'http://packages.elasticsearch.org/elasticsearch/1.1/centos',
#     gpgcheck => 1,
#     enabled => 1,
#     gpgkey => 'http://packages.elasticsearch.org/GPG-KEY-elasticsearch'
# } ->
service {'iptables':
    ensure => 'stopped'
} 

class { 'java':} ->
class { 'elasticsearch': 
    config => {
        'index' => {
            'number_of_replicas' => '0',
            'number_of_shards'   => '2'
        },
    },
    status => enabled,
    manage_repo  => true,
    repo_version => '1.1',
} 

elasticsearch::plugin{'mobz/elasticsearch-head':
   module_dir => 'head'
}
