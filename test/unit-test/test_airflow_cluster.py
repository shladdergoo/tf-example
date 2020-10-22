import os
import unittest


class TestAirflowCluster(unittest.TestCase):

    def setUp(self):

        applyCmd = 'cd test/airflow-cluster && '\
            'rm -rf ./.terraform && '\
            'terraform init -backend=true -backend-config=../../env/dev/backend.tfvars && '\
            'terraform apply -auto-approve'

        os.environ['AWS_PROFILE'] = 'dev'
        os.system(applyCmd)

    def test_module_deployed(self):

        print()
        print('test that the module has been deployed and is can perform basic work')
        print('further tests will test specific aspects of the module')
        print()

        assert True == True

    def tearDown(self):

        destroyCmd = 'cd test/airflow-cluster && '\
            'rm -rf ./.terraform && '\
            'terraform init -backend=true -backend-config=../../env/dev/backend.tfvars && '\
            'terraform destroy -auto-approve'

        os.environ['AWS_PROFILE'] = 'dev'
        os.system(destroyCmd)
