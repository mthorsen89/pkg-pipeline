resource "aws_iam_role_policy" "container_builder_codepipeline_policy" {
  name = "container_builder_codepipeline_policy"
  role = "${aws_iam_role.container_builder_codepipeline_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
        "Action": [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:GetBucketVersioning"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "s3:PutObject"
        ],
        "Resource": [
          "arn:aws:s3:::codepipeline*",
          "arn:aws:s3:::elasticbeanstalk*"
        ],
        "Effect": "Allow"
      },
      {
        "Action": [
          "codecommit:CancelUploadArchive",
          "codecommit:GetBranch",
          "codecommit:GetCommit",
          "codecommit:GetUploadArchiveStatus",
          "codecommit:UploadArchive"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "codedeploy:CreateDeployment",
          "codedeploy:GetApplicationRevision",
          "codedeploy:GetDeployment",
          "codedeploy:GetDeploymentConfig",
          "codedeploy:RegisterApplicationRevision"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "elasticbeanstalk:*",
          "ec2:*",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "cloudwatch:*",
          "s3:*",
          "sns:*",
          "cloudformation:*",
          "rds:*",
          "sqs:*",
          "ecs:*",
          "iam:PassRole"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "lambda:InvokeFunction",
          "lambda:ListFunctions"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "opsworks:CreateDeployment",
          "opsworks:DescribeApps",
          "opsworks:DescribeCommands",
          "opsworks:DescribeDeployments",
          "opsworks:DescribeInstances",
          "opsworks:DescribeStacks",
          "opsworks:UpdateApp",
          "opsworks:UpdateStack"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "cloudformation:CreateStack",
          "cloudformation:DeleteStack",
          "cloudformation:DescribeStacks",
          "cloudformation:UpdateStack",
          "cloudformation:CreateChangeSet",
          "cloudformation:DeleteChangeSet",
          "cloudformation:DescribeChangeSet",
          "cloudformation:ExecuteChangeSet",
          "cloudformation:SetStackPolicy",
          "cloudformation:ValidateTemplate",
          "iam:PassRole"
        ],
        "Resource": "*",
        "Effect": "Allow"
      },
      {
        "Action": [
          "codebuild:BatchGetBuilds",
          "codebuild:StartBuild"
        ],
        "Resource": "*",
        "Effect": "Allow"
      }
    ]
  }
EOF
}

resource "aws_iam_policy" "container_builder_codebuild_policy" {
  name        = "container_builder_codebuild_policy"
  path        = "/service-role/"
  description = "Policy used in trust relationship with CodeBuild"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "s3:*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ecr:*"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "container_builder_codebuild_policy_attachment" {
  name       = "container_builder_codebuild_policy_attachment"
  policy_arn = "${aws_iam_policy.container_builder_codebuild_policy.arn}"
  roles      = ["${aws_iam_role.container_builder_codebuild_role.id}"]
}
