SfnRegistry.register(:controller_seed) do |_name, _config = {}|
  {
    'EMPIRE_HOSTGROUP'                => 'controller',
    'EMPIRE_DATABASE_USER'            => ref!(:empire_database_user),
    'EMPIRE_DATABASE_PASSWORD'        => ref!(:empire_database_password),
    'EMPIRE_DATABASE_HOST'            => "empire-rds.#{ENV['private_domain']}",
    'EMPIRE_ENVIRONMENT'              => ENV['environment'],
    'EMPIRE_GITHUB_CLIENT_ID'         => ref!(:github_client_id),
    'EMPIRE_GITHUB_CLIENT_SECRET'     => ref!(:github_client_secret),
    'EMPIRE_GITHUB_ORGANIZATION'      => ref!(:github_organization),
    'EMPIRE_TOKEN_SECRET'             => ref!(:empire_token_secret),
    'EMPIRE_ELB_SG_PRIVATE'           => attr!(:minion_ec2_security_group, 'GroupId'),
    'EMPIRE_ELB_SG_PUBLIC'            => attr!(:controller_ec2_security_group, 'GroupId'),
    'EMPIRE_EC2_SUBNETS_PRIVATE'      => join!(registry!(:my_private_subnet_ids), { :options => { :delimiter => ','}}),
    'EMPIRE_EC2_SUBNETS_PUBLIC'       => join!(registry!(:my_public_subnet_ids), { :options => { :delimiter => ','}}),
    'EMPIRE_ECS_SERVICE_ROLE'         => ref!(:controller_i_a_m_role),
    'EMPIRE_ROUTE53_INTERNAL_ZONE_ID' => registry!(:my_hosted_zone, ENV['private_domain']),
    'EMPIRE_AWS_DEBUG'                => 'false',
    'EMPIRE_ECS_CLUSTER'              => ref!(:minion_ecs_cluster),
    'ECS_AGENT_VERSION'               => ref!(:ecs_agent_version),
    'ECS_CLUSTER'                     => ref!(:controller_ecs_cluster),
    'DOCKER_USER'                     => ref!(:docker_user),
    'DOCKER_PASS'                     => ref!(:docker_pass),
    'DOCKER_EMAIL'                    => ref!(:docker_email),
    'DOCKER_REGISTRY'                 => ref!(:docker_registry),
    'DOCKER_VERSION'                  => ref!(:docker_version),
    'NEW_RELIC_LICENSE_KEY'           => ref!(:new_relic_license_key),
    'NEW_RELIC_SERVER_LABELS'         => ref!("#{_name}_new_relic_server_labels".to_sym),
    'SUMOLOGIC_ACCESS_ID'             => ref!(:sumologic_access_id),
    'SUMOLOGIC_ACCESS_KEY'            => ref!(:sumologic_access_key),
    'ENABLE_SUMOLOGIC'                => ref!(:enable_sumologic)
  }
end