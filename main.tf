provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}

resource "databricks_cluster" "job_cluster" {
  cluster_name            = "shared-job-cluster"
  spark_version           = "13.3.x-scala2.12"
  node_type_id            = var.node_type_id
  autotermination_minutes = 10
  
  spark_conf = {
    "spark.master"                         = "local[*, 4]"
    "spark.databricks.cluster.profile"     = "singleNode"
  }

  custom_tags = {
    ResourceClass = "SingleNode"
  }
  
  single_user_name    = "p09k91a0227@outlook.com"
  data_security_mode  = "SINGLE_USER"
  runtime_engine      = "STANDARD"

  library {
    pypi {
      package = "pandas"
    }
  }

  library {
    pypi {
      package = "requests"
    }
  }
}


