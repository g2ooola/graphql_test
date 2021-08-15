# README


### mutation 語法範例

一般的 query 欄位中填入以下範例，其中 SomeMutation 可以不填或甜任意值
```graphql
mutation SomeMutation($input: CreateProjectInput!) {
  createProject(input: $input) {
    project {
      name
      id
    }
  }
}
```

在下方的變數欄位中填入

```grqphql
{
  "input":{
    "name":"product j",
    "organizationId":1,
    "workingMode":"ONLINE_ONLY"
  }
}
```

### 